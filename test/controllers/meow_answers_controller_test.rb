require 'test_helper'

class MeowAnswersControllerTest < ActionController::TestCase
  test "should post create" do
    post :create, format: :json, meow_answer: {up: true, user_id: 2, answer_id: 1}
    assert_response :success
  end
end
