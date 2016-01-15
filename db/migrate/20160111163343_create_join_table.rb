class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :items, :tags do |t|
      t.index :item_id
      t.index :tag_id
    end
  end
end
