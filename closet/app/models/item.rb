class Item < ActiveRecord::Base
  has_many :outfit_items, dependent: :destroy
  has_many :outfits, through: :outfit_items
  has_and_belongs_to_many :tags
end
