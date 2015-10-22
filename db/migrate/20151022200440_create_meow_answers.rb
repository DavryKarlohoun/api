class CreateMeowAnswers < ActiveRecord::Migration
  def change
    create_table :meow_answers do |t|
      t.integer :user_id
      t.integer :answer_id
      t.boolean :up

      t.timestamps null: false
    end
  end
end
