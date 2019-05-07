class AddItineraryToGuides < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :itinerary, :string
  end
end
