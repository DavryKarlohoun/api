class Question < ActiveRecord::Base
  has_many :answers
  has_one  :accepted_answer, ->(question) { where(id: question.accepted_answer_id) }, class_name: 'Answer'
  belongs_to :user
  has_many :meow_questions
  has_many :meow_answers

  scope :by_meows, -> {
    Question.joins('LEFT OUTER JOIN meow_questions ON questions.id = meow_questions.question_id ')
      .select("questions.*, count(meow_questions.question_id) as question_count")
      .group("questions.id")
      .order("question_count DESC")
    }

end
