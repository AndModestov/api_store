class CreateExemplars < ActiveRecord::Migration[5.0]
  def change
    create_table :exemplars do |t|
      t.integer :store_id
      t.integer :product_id
      t.string :product_type
      t.timestamps
    end

    add_index :exemplars, :store_id
    add_index :exemplars, [:product_id, :product_type]
  end
end
