class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :value
      t.integer :user_id
      t.integer :guide_id

      t.timestamps
    end
  end
end
