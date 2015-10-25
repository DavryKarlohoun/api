class QuestionsController < ApplicationController

  def index
    @questions = Question.by_meows
  end

  def show
    q = Question.where(id: params[:id]).first
    if q
      render q
    else
      render json: {error: {code: 404, message: "Could not find question"}}
    end
  end

  def edit
    u = User.where(token: request.headers["user-token"]).first
    if u
      question = Question.where(params[:id]).first
      if question.user == u
        if question.user.token == request.headers["user-token"]
          question.update(question_params)
        else
          render json: {error: {code: 403, message: "Provided token does not match user's token"}}, status: :forbidden
        end
      else
        render json: {error: {code: 403, message: "Question does not belong to user"}}, status: :forbidden
      end
    else
      render json: {error: {code: 404, message: "Could not find user by token"}}, status: :notfound
    end
  end

  def create
    u = User.where(token: request.headers["user-token"]).first
    if u
      q = Question.new(question_params)
      q.user_id = u.id
      q.save
      render q
    else
      render json: {error: {code: 404, message: "Could not find user"}}, status: :notfound
    end
  end

  def question_params
    params.permit(:id, :user_id, :accepted_answer_id, :title, :description)
  end
end
