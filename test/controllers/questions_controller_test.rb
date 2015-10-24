require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should get show" do
    get :show, id: @question, format: :json
    assert_response :success
  end

  test "should put edit" do
    put :edit, id: @question, format: :json, question: {user_id: 1, accepted_answer_id: 2, title: "title", description: "description"}
    assert_response :success
  end

  test "should post create" do
    post :create, format: :json, question: {user_id: 1, accepted_answer_id: 2, title: "title", description: "description"}
    assert_response :success
  end

end
