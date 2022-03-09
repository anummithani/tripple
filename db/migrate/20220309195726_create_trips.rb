class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :city
      t.string :country
      t.string :trip_name
      t.string :trip_image
      t.date :arrival_date
      t.date :departure_date

      t.timestamps
    end
  end
end
