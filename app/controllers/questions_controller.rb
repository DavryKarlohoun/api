class QuestionsController < ApplicationController

  def index
    @questions = Question.by_meows
  end

  def show
    q = Question.where(id: params[:id]).first
    q ? render(q) : render(json: {error: "Could not find question"})
  end

  def edit
    u = User.where(token: request.headers["user-token"]).first
    if u
      question = Question.where(params[:id]).first
      if question.user == u
        if question.user.token == request.headers["user-token"]
          question.update(question_params)
        else
          render json: {error: "Provided token does not match user's token"}
        end
      else
        render json: {error: "Question does not belong to user"}
      end
    else
      render json: {error: "Could not find user by token"}
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
      render json: {error: "Could not find user"}
    end
  end

  def question_params
    params.permit(:id, :user_id, :accepted_answer_id, :title, :description)
  end
end
