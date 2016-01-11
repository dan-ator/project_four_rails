class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
