class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :publisher_id
      t.timestamps
    end

    add_index :books, :publisher_id
  end
end
