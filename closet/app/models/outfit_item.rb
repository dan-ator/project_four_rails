class OutfitItem < ActiveRecord::Base
  belongs_to :outfits
  belongs_to :items
end
