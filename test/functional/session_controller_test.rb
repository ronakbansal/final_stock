require 'test_helper'

class SessionControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get welcome" do
    get :welcome
    assert_response :success
  end

end
