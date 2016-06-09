require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:joe)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { first_name: "",
                             last_name: "  ",
                             email: "user@invalid",
                             birthday: "",
                             password: "wrong",
                             password_confirmation: "not right"}
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    first_name = "Test"
    email = "user@valid.com"
    patch user_path(@user), user: { first_name: first_name,
                             last_name: "User",
                             username: "TestUser",
                             email: email,
                             birthday: "01-01-2000",
                             password: "",
                             password_confirmation: ""}
    assert_redirected_to @user
    assert_not flash.empty?
    @user.reload
    assert_equal @user.first_name, first_name
    assert_equal @user.email, email
  end
end
