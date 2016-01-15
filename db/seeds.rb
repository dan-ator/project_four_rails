# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

Item.destroy_all
Outfit.destroy_all
OutfitItem.destroy_all
Tag.destroy_all

Item.create!(name: "red shirt", description: "short-sleeved red button down shirt", category: "shirt", image: "http://img.costumecraze.com/images/vendors/rubies/888984-Deluxe-Adult-Star-Trek-Red-Shirt-Costume-large.jpg", color: "red", fabric_type: "polyester" )
Item.create!(name: "blue shirt", description: "long-sleeved blue button down shirt", category: "shirt", image: "http://workingperson.com/media/catalog/product/cache/1/image/400x/9df78eab33525d08d6e5fb8d27136e95/i/m/image_87310.jpg", color: "blue", fabric_type: "cotton" )
Item.create!(name: "purple shirt", description: "long-sleeved purple button down shirt", category: "shirt", image: "http://www.cotondoux.com/11037-thickbox/mens-shirt-napolitan-cuffs.jpg", color: "purple", fabric_type: "wool" )
Item.create!(name: "pink pants", description: "pink corduroy pants", category: "pants", image: "http://www.upscalehype.com/wp-content/uploads/2012/05/Dsquared2-pink-pants.jpg", color: "pink", fabric_type: "cotton" )
Item.create!(name: "blue pants", description: "dark blue denim pants", category: "pants", image: "https://fashionculturesparsons.files.wordpress.com/2015/05/blue_jeans1.jpg", color: "dark blue", fabric_type: "cotton" )
Item.create!(name: "brown belt", description: "leather brown belt, wide", category: "belts", image: "http://cdn3.volusion.com/luyxe.dexsa/v/vspfiles/photos/35BRchBrnDloopL5988govblk-2.jpg", color: "brown", fabric_type: "leather" )
Item.create!(name: "brown shoes", description: "leather brown dress shoes", category: "shoes", image: "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSMWpcbHufVVivo6I1OGKZC85Tspb3PaD1cEFic-AINO5Fib7JC", color: "brown", fabric_type: "leather" )

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
