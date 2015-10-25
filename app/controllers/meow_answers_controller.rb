class MeowAnswersController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    if u
      ma = MeowAnswer.new(meow_answer_params)
      ma.user_id = u.id
      if ma.save
        render ma
      elsif ma.errors
        render json: {error: {code: 400, server_message: ma.errors}}, status: :bad_request
      else
        render json: {error: {code: 500, message: "Could not save meow"}}, status: :internal_server_error
      end
    else
      render json: {error: {code: 404, message: "Could not find user by token"}}, status: :not_found
    end
  end

  def show
    render MeowAnswer.where(params[:id]).first
  end

  def meow_answer_params
    params.permit(:id, :answer_id, :up)
  end
end
