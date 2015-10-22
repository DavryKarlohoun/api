class Question < ActiveRecord::Base
  has_many :answers
  has_one :accepted_answer
end
