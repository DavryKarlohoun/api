require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    request.accept = "application/json"
    get :index
    assert_response :success
  end

  test "should get show" do
    request.accept = "application/json"
    get :show, id: @question
    assert_response :success
  end

  test "should put edit" do
    request.accept = "application/json"
    put :edit, id: @question, question: {user_id: 1, accepted_answer_id: 2, title: "title", description: "description"}
    assert_response :success
  end

  test "should post create" do
    request.accept = "application/json"
    post :create, id: @question, question: {user_id: 1, accepted_answer_id: 2, title: "title", description: "description"}
    assert_response :success
  end

end
