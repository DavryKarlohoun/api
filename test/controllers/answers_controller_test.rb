require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should post create" do
    request.accept = "application/json"
    request.headers["user-token"] = @user.token
    post :create, {question_id: 2, answer_text: "answer"}
    assert_response :success
  end

end
