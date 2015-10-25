class QuestionsController < ApplicationController
  before_action :current_user, only: [:edit, :create]


  def index
    @questions = Question.by_meows
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
    u = current_user
    if @question.user == u
      if u.token == params[:token]
        @question.update(question_params)
      else
        render json: {error: "Provided token does not match user's token"}
      end
    else
      render json: {error: "Question does not belong to user"}
    end
  end

  def create
   @question = Question.new(question_params)
   @question.save
  end

  def question_params
    params.require(:question).permit(:id, :user_id, :accepted_answer_id, :title, :token, :description)
  end
end
