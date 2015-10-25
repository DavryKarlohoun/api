require 'test_helper'

class MeowAnswersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @answer = answers(:one)
  end

  test "should post create" do
    request.accept = "application/json"
    request.headers["user-token"] = @user.token
    post :create, {up: true, answer_id: @answer.id}
    assert_response :success
  end
end
