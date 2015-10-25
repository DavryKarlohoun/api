class MeowAnswersController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    ma = MeowAnswer.new(meow_answer_params)
    ma.user_id = u.id
    if ma.save
      render ma
    else
      render json: {error: {code: 500, message: "Could not save meow", server_message: ma.errors}}, status: :error
    end
  end

  def show
    render MeowAnswer.where(params[:id]).first
  end

  def meow_answer_params
    params.permit(:id, :answer_id, :up)
  end
end
