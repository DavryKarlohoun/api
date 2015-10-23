class AnswersController < ApplicationController
  def create
  end

  def answer_params
      params.require(:answer).permit(:id, :user_id, :question_id, :answer_text)
  end
end
