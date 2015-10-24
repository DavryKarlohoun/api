require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  test "should post create" do
    post :create, format: :json, answer: {user_id: 1, question_id: 2, answer_text: "answer"}
    assert_response :success
  end

end
