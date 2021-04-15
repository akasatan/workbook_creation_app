class CreateWordQuizItems < ActiveRecord::Migration[5.2]
  def change
    create_table :word_quiz_items do |t|
      t.integer :word_quiz_id
      t.text :correct_word
      t.text :explanation

      t.timestamps
    end
  end
end
