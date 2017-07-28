class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :company_id
      t.timestamps
    end

    add_index :stores, :company_id
  end
end
