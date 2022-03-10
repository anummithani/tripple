class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :trip_id
      t.datetime :datetime

      t.timestamps
    end
  end
end
