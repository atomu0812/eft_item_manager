class AddRequiredQuantityToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :required_quantity, :integer
  end
end
