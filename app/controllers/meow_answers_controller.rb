class MeowAnswersController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    meow_answer = MeowAnswer.new(meow_answer_params)
    meow_answer.user_id = u.id
    meow_answer.save
  end

  def meow_answer_params
      params.permit(:id, :answer_id, :up)
  end
end
