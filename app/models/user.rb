class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :meow_questions
  has_many :meow_answers
end
