class Outfit < ActiveRecord::Base
  has_many :outfit_items
  has_many :items, through: :outfit_items
end
