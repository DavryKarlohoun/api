class AnswersController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    if u
      a = Answer.new(answer_params)
      a.user_id = u.id
      a.save
      render a
    else
      render json: {error: {code: 500, message: "Could not save answer", server_message: a.errors}}, status: :error
    end
  end

  def show
    a = Answer.where(id: params[:id]).first
    if a
      render a
    else
      render json: {error: {code: 404, message: "Could not find answer"}}, status: :notfound
    end
  end

  def answer_params
    params.permit(:id, :user_id, :question_id, :answer_text)
  end
end

