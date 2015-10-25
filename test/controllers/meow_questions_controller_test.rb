require 'test_helper'

class MeowQuestionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @answer = answers(:one)
  end

  test "should post create" do
    request.accept = "application/json"
    request.headers["user-token"] = @user.token
    post :create, {up: true, question_id: 1}
    assert_response :success
  end

end
