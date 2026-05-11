class AddTraderToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :trader, :string
  end
end