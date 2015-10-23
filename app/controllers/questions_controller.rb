class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def create
  end

  def question_params
      params.require(:question).permit(:id, :user_id, :accepted_answer_id, :title, :description)
  end
end
