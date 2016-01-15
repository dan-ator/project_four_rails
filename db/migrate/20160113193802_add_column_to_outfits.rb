class AddColumnToOutfits < ActiveRecord::Migration
  def change
    add_column :outfits, :category, :string
  end
end
