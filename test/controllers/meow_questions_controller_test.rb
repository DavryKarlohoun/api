require 'test_helper'

class MeowQuestionsControllerTest < ActionController::TestCase
  test "should post create" do
    post :create, format: :json, meow_question: {up: true, user_id: 2, question_id: 1}
    assert_response :success
  end

end
