class AddLevelToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :level, :integer, null: false, default: 1
  end
end