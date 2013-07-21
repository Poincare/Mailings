require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  #for good luck
  test "the truth" do
    assert true
  end

  #test has_many :mails
  test "association with mail" do
    m = SnailMail.new

    #this should fail if the has_many association is not functional
    @user.snail_mails << m
  end

  test "should count number of mails" do
    10.times do
      m = SnailMail.new
      @user.snail_mails << m
    end

    expected_count = 10
    count = @user.count_mails

    assert_equal(expected_count, count)
  end

  test "should count total price correctly" do
    10.times do
      m = SnailMail.new :page_count => 8
      @user.snail_mails << m
    end

    #notice that the price for a page count of 8 is 410 cents
    expected_price = 10 * 410
    price = @user.total_price

    assert_equal(expected_price, price)
  end

  test "should be able to set a user's address" do
    @user.address = "123 Nonexistent Drive\nNowhere, CA\nUSA"
    assert @user.save
  end
end
