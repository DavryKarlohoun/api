class AnswersController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    if u
      a = Answer.new(answer_params)
      a.user_id = u.id
      if a.save
        render a
      elsif a.errors
        render json: {error: {code: 400, server_message: a.errors}}, status: :bad_request
      else
        render json: {error: {code: 500, message: "Could not save answer"}}, status: :internal_server_error
      end
    else
      render json: {error: {code: 404, message: "Could not find user"}}, status: :not_found
    end
  end

  def show
    a = Answer.where(id: params[:id]).first
    if a
      render a
    else
      render json: {error: {code: 404, message: "Could not find answer"}}, status: :not_found
    end
  end

  def answer_params
    params.permit(:id, :user_id, :question_id, :answer_text)
  end
end

