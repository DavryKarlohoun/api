class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :meow_answers
  belongs_to :user

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_text, presence: true

  scope :by_meows, -> {
    Answer.all.sort_by { |a| [a.accepted? ? 0 : 1, -a.net_meows] }
  }

  def net_meows
    meow_answers.where(up: true).count - meow_answers.where(up: false).count
  end

  def accepted?
    Question.exists?(accepted_answer_id: id)
  end

end

