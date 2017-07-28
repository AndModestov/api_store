class AddStatusToExemplars < ActiveRecord::Migration[5.0]
  def change
    add_column :exemplars, :status, :integer, default: 0
    add_index :exemplars, :status
  end
end
