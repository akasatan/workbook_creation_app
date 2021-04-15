class CreateWordQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :word_quizzes do |t|
      t.integer :workbook_item_id
      t.text :quiz

      t.timestamps
    end
  end
end
