class CreateBookmarkItems < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmark_items do |t|
      t.integer :bookmark_id
      t.integer :workbook_id

      t.timestamps
    end
  end
end
