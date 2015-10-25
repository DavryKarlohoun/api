class User < ActiveRecord::Base
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :meow_questions
  has_many :meow_answers

  validates :full_name, presence: true
  validates :display_name,  presence: true,
                            uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: {
                      with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
                      message: "Not a valid email address",
                      on: :create
                    }
  validates :password, length: { minimum: 8 }, allow_nil: true

  def total_meows
    meow_questions.count + meow_answers.count
  end
end
