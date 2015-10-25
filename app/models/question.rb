class Question < ActiveRecord::Base
  has_many :answers
  has_one  :accepted_answer, ->(question) { where(id: question.accepted_answer_id) }, class_name: 'Answer'
  belongs_to :user
  has_many :meow_questions
  has_many :meow_answers

  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true

  scope :by_meows, -> { Question.all.sort { |a,b| a.net_meows <=> b.net_meows}.reverse }
  scope :with_accepted_answer, -> { Question.all.where('accepted_answer_id IS NOT NULL') }

  def net_meows
    meow_questions.where(up: true).count - meow_questions.where(up: false).count
  end

end
