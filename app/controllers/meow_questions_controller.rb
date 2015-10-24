class MeowQuestionsController < ApplicationController
  def create
    @meow_question = MeowQuestion.new(meow_question_params)
  end

  def meow_question_params
      params.require(:meow_question).permit(:id, :user_id, :question_id, :up)
  end
end
