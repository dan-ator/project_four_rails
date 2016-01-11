class Item < ActiveRecord::Base
  belongs_to :user
  has many :outfit_items, dependent: :destroy
  has_many :outfits, through: :outfit_items
  has_many :tags, through: :item_tags
end
