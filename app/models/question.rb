class Question < ActiveRecord::Base
  has_many :answers
  has_one  :accepted_answer, ->(id) { where(accepted_answer_id: id) }, :class_name=> "Answer"
end
