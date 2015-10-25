class MeowQuestionsController < ApplicationController
  def create
    u = User.where(token: request.headers["user-token"]).first
    meow_question = MeowQuestion.new(meow_question_params)
    meow_question.user_id = u.id
    meow_question.save
  end

  def meow_question_params
    params.permit(:id, :question_id, :up)
  end
end
