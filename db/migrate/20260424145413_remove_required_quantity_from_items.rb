class RemoveRequiredQuantityFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :required_quantity, :integer
  end
end
