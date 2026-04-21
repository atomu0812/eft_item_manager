class CreateHideouts < ActiveRecord::Migration[7.1]
  def change
    create_table :hideouts do |t|
      t.string :name

      t.timestamps
    end
  end
end
