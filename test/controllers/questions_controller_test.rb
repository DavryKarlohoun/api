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
    request.headers["user-token"] = @question.user.token
    put :update, {id: @question.id, accepted_answer_id: 2, title: "title", description: "description"}
    assert_response :success
  end

  test "should post create" do
    request.accept = "application/json"
    temp_user = User.create!(full_name: "temp_user", email: "temp_user@me.com", password:"temp_user", token: "test", display_name: "temp_user")
    request.headers["user-token"] = "test"
    post :create, {accepted_answer_id: 2, title: "title", description: "description"}
    assert_response :success
  end

end
