require 'test_helper'


class SessionsControllerTest < ActionController::TestCase
  fixtures :users

  test "should post create" do
    u = User.create!(display_name: "test-#{rand(1.1000)}", email: "test-#{rand(1.1000)}@whatever.com", password: "password", full_name: "something-#{rand(1.1000)}")
    request.accept = "application/json"
    post :create, {display_name: "somethingelse-#{rand(1.1000)}", full_name: "something", email: u.email, password: "password"}
    assert_response :success
  end

  test "should delete destroy" do
    request.accept = "application/json"
    u = User.create!(display_name: "something_else2-#{rand(1.1000)}", full_name: "something", email: "test-#{rand(1.1000)}@whatever.com", password: "password", token: "test")
    request.headers["user-token"] = u.token
    delete :destroy
    assert_response :success
  end

end
