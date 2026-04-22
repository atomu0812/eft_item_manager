class CreateItemTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :item_tasks do |t|
      t.references :item, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.integer :required_quantity

      t.timestamps
    end
  end
end
