class CreateItemHideouts < ActiveRecord::Migration[7.1]
  def change
    create_table :item_hideouts do |t|
      t.references :item, null: false, foreign_key: true
      t.references :hideout, null: false, foreign_key: true
      t.integer :required_quantity

      t.timestamps
    end
  end
end
