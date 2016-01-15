class AddColumnsToItems < ActiveRecord::Migration
  def change
    add_column :items, :color, :string
    add_column :items, :fabric_type, :string
  end
end
