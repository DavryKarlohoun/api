class QuestionsController < ApplicationController

  def index
    @questions = Question.by_meows
  end

  def search
    if params[:search]
      q = "%#{params[:search]}%"
      @questions = Question.where('title LIKE ? OR description LIKE ?', q, q)
      render :index
    else
      render json: {error: {code: 400, message: "Must provide a search term"}}, status: :bad_request
    end
  end

  def create
    u = User.where(token: request.headers["user-token"]).first
    if u
      q = Question.new(question_params)
      q.user_id = u.id
      if q.save
        render q
      elsif q.errors
        render json: {error: {code: 400, server_message: q.errors}}, status: :bad_request
      else
        render json: {error: {code: 500, message: "Could not save question"}}, status: :internal_server_error
      end
    else
      render json: {error: {code: 404, message: "Could not find user"}}, status: :not_found
    end
  end

  def show
    q = Question.where(id: params[:id]).first
    if q
      render q
    else
      render json: {error: {code: 404, message: "Could not find question"}}
    end
  end

  def update
    u = User.where(token: request.headers["user-token"]).first
    if u
      question = Question.where(params[:id]).first
      if question.user == u
        if question.user.token == request.headers["user-token"]
          question.update(question_params)
          render question
        else
          render json: {error: {code: 403, message: "Provided token does not match user's token"}}, status: :forbidden
        end
      else
        render json: {error: {code: 403, message: "Question does not belong to user"}}, status: :forbidden
      end
    else
      render json: {error: {code: 404, message: "Could not find user by token"}}, status: :not_found
    end
  end


  def question_params
    params.permit(:id, :user_id, :search, :accepted_answer_id, :title, :description)
  end
end
