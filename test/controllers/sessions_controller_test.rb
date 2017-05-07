require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should see login page" do
    get login_path
    assert_response :success
    assert_select "title", "Login | #{@common_title}"
  end
end
