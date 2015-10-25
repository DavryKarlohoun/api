class MeowAnswer < ActiveRecord::Base
  belongs_to :answer

  validates :user_id, presence: true
  validates :answer_id, presence: true
  validates :up, presence: true
end
