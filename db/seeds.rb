Item.find_or_create_by!(name: "Salewa first aid kit") do |item|
  item.required_quantity = 3
end

Item.find_or_create_by!(name: "Gas analyzer") do |item|
  item.required_quantity = 2
end

Item.find_or_create_by!(name: "Spark plug") do |item|
  item.required_quantity = 5
end