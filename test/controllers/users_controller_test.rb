require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
	login_as(@user)
  end

  #test "should get index" do
  #  get users_url
  #  assert_response :success
  #  assert_not_nil assigns(:users)
  #end

  #test "should show user" do
  #  get user_url(@user)
  #  assert_response :success
  #end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, user: { email: @user.email, name: @user.name, password_digest: @user.password_digest }
    end

    assert_redirected_to user_url(User.last)
  end

  #test "should get edit" do
  #  get edit_user_url(@user)
  #  assert_response :success
  #end

  #test "should update user" do
  #  patch :update, id: @user, user: { email: @user.email, name: @user.name, password_digest: @user.password }
  #  assert_redirected_to user_path(assigns(:user))
  #end

  #test "should destroy user" do
  #  assert_difference('User.count', -1) do
  #    delete :destroy, id: @user
  #  end

    #assert_redirected_to users_path
  #end
end
