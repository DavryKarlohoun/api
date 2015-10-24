class QuestionsController < ApplicationController
  def index
    @questions = Question.by_meows
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    @question.update(question_params)
  end

  def create
   @question = Question.new(question_params)
   @question.save
  end

  def question_params
    params.require(:question).permit(:id, :user_id, :accepted_answer_id, :title, :description)
  end
end
