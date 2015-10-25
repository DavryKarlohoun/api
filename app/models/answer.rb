class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :meow_answers
  belongs_to :user

end
