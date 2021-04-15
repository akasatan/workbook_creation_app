class CreateWorkbookItems < ActiveRecord::Migration[5.2]
  def change
    create_table :workbook_items do |t|
      t.integer :workbook_id
      t.integer :quiz_type
      t.string :name

      t.timestamps
    end
  end
end
