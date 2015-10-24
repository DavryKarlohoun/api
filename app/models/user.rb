class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :meow_questions
  has_many :meow_answers

  def total_meows
    meow_questions.count + meow_answers.count
  end
end
