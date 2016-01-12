# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Item.destroy_all
Outfit.destroy_all
OutfitItem.destroy_all
Tag.destroy_all

Item.create!(name: "red shirt", description: "short-sleeved red button down shirt", category: "shirt", image: "", color: "red", fabric_type: "polyester" )
Item.create!(name: "blue shirt", description: "long-sleeved blue button down shirt", category: "shirt", image: "", color: "blue", fabric_type: "cotton" )
Item.create!(name: "purple shirt", description: "long-sleeved purple button down shirt", category: "shirt", image: "", color: "purple", fabric_type: "wool" )
Item.create!(name: "pink pants", description: "pink corduroy pants", category: "pants", image: "", color: "pink", fabric_type: "cotton" )
Item.create!(name: "blue pants", description: "dark blue denim pants", category: "pants", image: "", color: "dark blue", fabric_type: "cotton" )
Item.create!(name: "brown belt", description: "leather brown belt, wide", category: "belts", image: "", color: "brown", fabric_type: "leather" )
Item.create!(name: "brown shoes", description: "leather brown dress shoes", category: "shirt", image: "", color: "brown", fabric_type: "leather" )

Tag.create!(name: "fancy")
Tag.create!(name: "casual")
Tag.create!(name: "busines casual")
Tag.create!(name: "summer")
Tag.create!(name: "fall")
Tag.create!(name: "winter")

items = Item.all

outfit_names = ["dressy", "fancy", "casual"]

outfit_names.each do |name|
  current_outfit = Outfit.create!(name: name)
  current_outfit.items << items.sample(rand(3) + 1)
end

items.each do |item|
  item.tags << Tag.all.sample(1)
end
