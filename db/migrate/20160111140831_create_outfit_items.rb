class CreateOutfitItems < ActiveRecord::Migration
  def change
    create_table :outfit_items do |t|
      t.references :item, index: true, foreign_key: true
      t.references :outfit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
