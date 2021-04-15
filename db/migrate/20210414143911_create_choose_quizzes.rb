class CreateChooseQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :choose_quizzes do |t|
      t.integer :workbook_item_id
      t.text :quiz
      t.integer :judge
      t.text :explanation

      t.timestamps
    end
  end
end
