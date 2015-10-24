require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get show" do
    get :show, id: @user, format: :json
    assert_response :success
  end

  test "should get edit" do
    put :edit, id: @user, format: :json, user: {full_name: "ryan", email: "r@exmple.com", password: "password", token: SecureRandom.hex, display_name: "rgraham"}
    assert_response :success
  end

  test "should get create" do
    post :create, format: :json, user: {full_name: "ryan", email: "r@exmple.com", password: "password", token: SecureRandom.hex, display_name: "rgraham"}
    assert_response :success
  end

  test "should get destroy" do
    delete_me_user = User.create!(full_name: "deleteme", email: "deleteme@me.com", password:"deleted", token: "2134", display_name: "deleteme")
    assert_difference 'User.count', -1 do
      delete :destroy, format: :json, id: delete_me_user
      assert_response :success
    end
  end

end
