class AddIndices < ActiveRecord::Migration
  def change
    add_index :answers, [:user_id, :question_id]
    add_index :meow_answers, [:user_id, :answer_id]
    add_index :meow_questions, [:user_id, :question_id]
    add_index :questions, [:user_id, :accepted_answer_id, :title]
    add_index :users, [:token, :email]
  end
end
