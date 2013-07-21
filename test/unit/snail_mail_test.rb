require 'test_helper'

class SnailMailTest < ActiveSupport::TestCase
  def setup
    @mail = snail_mails(:one)
  end

  test "the truth" do
    assert true
  end

  test "should calculate price correctly" do
    page_count = 8
    expected_price = 410
    price = SnailMail.calc_price page_count
    
    assert_equal price, expected_price

    page_count = 0
    expected_price = 170
    price = SnailMail.calc_price page_count
    assert_equal price, expected_price
  end

  test "should get page count correctly" do 
    file_url = @mail.file_url
    expected_page_count = 8
    page_count = SnailMail.page_count(file_url) 
  
    assert_equal expected_page_count, page_count
  end 
end
