class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :trip_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
