class Outfit < ActiveRecord::Base
  belongs_to :user
  has many :outfit_items
  has_many :items, through: :outfit_items
end
