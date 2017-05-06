require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signups" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "kiran",
                                         email: "kiran@gurujada.org",
                                         password: "kirankumar",
                                         password_confirmation: "kirankumarr"}}
    end
    assert_template 'users/new'
  end

  test "valid signups" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "kiran",
                                         email: "kiran@gurujada.org",
                                         password: "kirankumar",
                                         password_confirmation: "kirankumar"}}
    end
    follow_redirect!
    assert_template 'home/index'
  end
end
