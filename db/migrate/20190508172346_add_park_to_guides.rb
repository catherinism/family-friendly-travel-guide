class AddParkToGuides < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :park, :string
  end
end
