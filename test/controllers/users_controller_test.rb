require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should see signup page" do
    get signup_path
    assert_response :success
    assert_select "title", "Signup | #{@common_title}"
  end
end
