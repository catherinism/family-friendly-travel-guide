class AddColumnsToGuides < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :airport, :string
    add_column :guides, :restaurant, :string
    add_column :guides, :luggage_storage, :string
    add_column :guides, :baby_gear_rental, :string
    add_column :guides, :zoo, :string
  end
end
