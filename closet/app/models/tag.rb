class Tag < ActiveRecord::Base
  has_many :items, through: :items_tags

end
