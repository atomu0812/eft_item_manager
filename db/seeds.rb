# frozen_string_literal: true

puts "Seeding start..."

ItemTask.delete_all
ItemHideout.delete_all
Task.delete_all
Hideout.delete_all
UserItem.delete_all
Item.delete_all

def find_or_create_item(name)
  Item.find_or_create_by!(name: name)
end

def find_or_create_task(name)
  Task.find_or_create_by!(name: name)
end

def find_or_create_hideout(name)
  Hideout.find_or_create_by!(name: name)
end

def register_task_requirement(item_name:, task_name:, required_quantity:)
  item = find_or_create_item(item_name)
  task = find_or_create_task(task_name)

  item_task = ItemTask.find_or_initialize_by(item: item, task: task)
  item_task.required_quantity = required_quantity
  item_task.save!
end

def register_hideout_requirement(item_name:, hideout_name:, required_quantity:)
  item = find_or_create_item(item_name)
  hideout = find_or_create_hideout(hideout_name)

  item_hideout = ItemHideout.find_or_initialize_by(item: item, hideout: hideout)
  item_hideout.required_quantity = required_quantity
  item_hideout.save!
end

register_hideout_requirement(item_name: "Corrugated hose", hideout_name: "Lavatory Lv2", required_quantity: 6)
register_hideout_requirement(item_name: "Pack of screws", hideout_name: "Lavatory Lv2", required_quantity: 6)
register_hideout_requirement(item_name: "Electric drill", hideout_name: "Lavatory Lv2", required_quantity: 1)

register_task_requirement(item_name: "MS2000 Marker", task_name: "BP Depot", required_quantity: 4)
register_task_requirement(item_name: "MS2000 Marker", task_name: "Shaking up the Teller", required_quantity: 1)
register_task_requirement(item_name: "Salewa first aid kit", task_name: "Shortage", required_quantity: 3)
register_task_requirement(item_name: "Iskra ration pack", task_name: "Acquaintance", required_quantity: 3)

puts "Seeding completed!"
puts "Items: #{Item.count}"
puts "Tasks: #{Task.count}"
puts "Hideouts: #{Hideout.count}"
puts "ItemTasks: #{ItemTask.count}"
puts "ItemHideouts: #{ItemHideout.count}"
