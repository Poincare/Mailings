require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  #difficult to test filepicker.io based interactions.
end
