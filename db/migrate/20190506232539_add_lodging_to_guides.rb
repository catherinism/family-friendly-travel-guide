class AddLodgingToGuides < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :lodging, :string
  end
end
