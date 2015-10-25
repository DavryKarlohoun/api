require 'test_helper'


class SessionsControllerTest < ActionController::TestCase
  fixtures :users

  test "should post create" do
    u = User.create!(email: "test-#{rand(1.1000)}@whatever.com", password: "password")
    request.accept = "application/json"
    post :create, {email: u.email, password: "password"}
    assert_response :success
  end

  test "should delete destroy" do
    request.accept = "application/json"
    u = User.create!(email: "test-#{rand(1.1000)}@whatever.com", password: "password", token: "test")
    request.headers["user-token"] = u.token
    delete :destroy
    assert_response :success
  end

end
