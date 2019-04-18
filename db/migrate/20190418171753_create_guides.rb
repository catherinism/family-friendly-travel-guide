class CreateGuides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |t|
      t.string :location
      t.string :summary
      t.integer :destination_id

      t.timestamps
    end
  end
end
