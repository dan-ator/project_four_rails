class OutfitItem < ActiveRecord::Base
  belongs_to :outfit
  belongs_to :item
end
