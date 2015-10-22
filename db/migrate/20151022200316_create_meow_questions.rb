class CreateMeowQuestions < ActiveRecord::Migration
  def change
    create_table :meow_questions do |t|
      t.integer :user_id
      t.integer :question_id
      t.boolean :up

      t.timestamps null: false
    end
  end
end
