require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get show" do
    request.accept = "application/json"
    get :show, id: @user
    assert_response :success
  end

  test "should put edit" do
    request.accept = "application/json"
    request.headers["user-token"] = @user.token
    put :update, id: @user, user: {full_name: "ryan", email: "r@exmple.com", password: "password", display_name: "rgraham"}
    assert_response :success
  end

  test "should get create" do
    request.accept = "application/json"
    post :create, {full_name: "ryan", email: "r@exmple.com", password: "password", display_name: "rgraham"}
    assert_response :success
  end

  test "should get destroy" do
    request.accept = "application/json"
    delete_me_user = User.create!(full_name: "deleteme", email: "deleteme@me.com", password:"deleted", token: "test", display_name: "deleteme")
    request.headers["user-token"] = delete_me_user.token
    assert_difference 'User.count', -1 do
      delete :destroy, id: delete_me_user
      assert_response :success
    end
  end

end
