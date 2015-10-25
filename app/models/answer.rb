class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :meow_answers
  belongs_to :user

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :answer_text, presence: true

end
