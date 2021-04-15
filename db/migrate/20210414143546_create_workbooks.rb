class CreateWorkbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :workbooks do |t|
      t.integer :user_id
      t.string :name
      t.integer :disclosure_range

      t.timestamps
    end
  end
end
