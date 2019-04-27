class CreateGuides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |t|
      t.string :title
      t.string :summary
      t.integer :destination_id
      t.integer :user_id

      t.timestamps
    end
  end
end
