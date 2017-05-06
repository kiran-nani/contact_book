require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "kiran", email: "chirravuri.nani@gmail.com",
                     password: "kirankumar", password_confirmation: "kirankumar")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should not be blank" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "name length should not be neither too long nor too short" do
    @user.name = "a" * 4 && "a" * 56
    assert_not @user.valid?
  end

  test "email should not be blank" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[kiran@gurujada.org KIRAN@gurujada.ORG Kiran.kumar@guru.jada
                         k-iran@guru-jada.org kiran+kumar@gurujad.a
                         kiran_kumar@gurujad.a]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[kiran@gurujada KIRAN.gurujada.ORG Kiran.kumar@g
                         k-iran@guru.1 kiran+kumar@guru+jada
                         kiran+kumar@guru+jada.com kiran+kumar@guru_jada.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    @duplicate_user = @user.dup
    @duplicate_user.email = @duplicate_user.email.upcase
    @user.save
    assert_not @duplicate_user.valid?
  end

  test "email should be saved as lower case" do
    mixed_case_email = "kiRaN@GuruJada.ORg"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
  
  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6 
    assert_not @user.valid?
  end

  test "password length should not be neither too long nor too short" do
    @user.password = @user.password_confirmation = "a" * 5 && "a" * 16
    assert_not @user.valid?
  end
end
