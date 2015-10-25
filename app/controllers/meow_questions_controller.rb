class MeowQuestionsController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    if u
      mq = MeowQuestion.new(meow_question_params)
      mq.user_id = u.id
      if mq.save
        render mq
      elsif mq.errors
        render json: {error: {code: 400, server_message: mq.errors}}, status: :bad_request
      else
        render json: {error: {code: 500, message: "Could not save meow"}}, status: :internal_server_error
      end
    else
      render json: {error: {code: 404, message: "Could not find user by token"}}, status: :not_found
    end
  end

  def show
    render MeowQuestion.where(params[:id]).first
  end

  def meow_question_params
    params.permit(:id, :question_id, :up)
  end
end
