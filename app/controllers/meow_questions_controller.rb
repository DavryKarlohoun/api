class MeowQuestionsController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    mq = MeowQuestion.new(meow_question_params)
    mq.user_id = u.id
    if mq.save
      render mq
    else
      render json: {error: {code: 500, message: "Could not save meow", server_message: mq.errprs}}, status: :error
    end
  end

  def show
    render MeowQuestion.where(params[:id]).first
  end

  def meow_question_params
    params.permit(:id, :question_id, :up)
  end
end
