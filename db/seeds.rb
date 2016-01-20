# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Item.destroy_all
Outfit.destroy_all
OutfitItem.destroy_all
Tag.destroy_all

Item.create!(name: "blue shirt", description: "short-sleeved blue button down shirt", category: "shirt", image: File.open(Rails.root + "app/assets/images/stock/short_sleeve_blue_shirt.jpg"), color: "blue", fabric_type: "polyester" )
Item.create!(name: "blue shirt", description: "long-sleeved blue button down shirt", category: "shirt", image: File.open(Rails.root + "app/assets/images/stock/blue_striped_shirt.jpeg"), color: "blue", fabric_type: "cotton" )
Item.create!(name: "purple pants", description: "purple ski pants", category: "pants", image: File.open(Rails.root + "app/assets/images/stock/purple_pants.jpeg"), color: "purple", fabric_type: "polyester")
Item.create!(name: "red pants", description: "red corduroy pants", category: "pants", image: File.open(Rails.root + "app/assets/images/stock/pants_red.jpg"), color: "red", fabric_type: "cotton" )
Item.create!(name: "blue shirt", description: "dark blue shirt", category: "shirt", image: File.open(Rails.root + "app/assets/images/stock/blue_shirt.jpg"), color: "blue", fabric_type: "cotton" )
Item.create!(name: "yellow pants", description: "yellow pants with crease", category: "pants", image: File.open(Rails.root + "app/assets/images/stock/yellow_pants.jpeg"), color: "yelow", fabric_type: "cotton" )
Item.create!(name: "brown shoes", description: "leather brown dress shoes", category: "shoes", image: File.open(Rails.root + "app/assets/images/stock/brown_shoes.jpeg"), color: "brown", fabric_type: "leather" )

Tag.create!(name: "fancy")
Tag.create!(name: "casual")
Tag.create!(name: "busines casual")
Tag.create!(name: "summer")
Tag.create!(name: "fall")
Tag.create!(name: "winter")

items = Item.all

outfit_names = ["brian", "mike", "carl"]
categories = ["dressy", "fancy", "casual"]

outfit_names.each do |name|
  current_outfit = Outfit.create!(name: name)
  current_outfit.items << items.sample(rand(3) + 1)
end

items.each do |item|
  item.tags << Tag.all.sample(1)
end
