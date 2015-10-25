class MeowQuestion < ActiveRecord::Base
  belongs_to :question

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :up, presence: true
end
