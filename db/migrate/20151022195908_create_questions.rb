class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :accepted_answer_id
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
