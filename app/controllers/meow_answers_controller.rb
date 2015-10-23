class MeowAnswersController < ApplicationController
  def create
  end

  def meow_answer_params
      params.require(:meow_answer).permit(:id, :user_id, :answer_id, :up)
  end
end
