class CreateWritingQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :writing_quizzes do |t|
      t.integer :workbook_item_id
      t.text :quiz
      t.text :correct_answer

      t.timestamps
    end
  end
end
