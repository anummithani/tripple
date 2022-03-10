class CreateAccommodations < ActiveRecord::Migration[6.0]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.datetime :check_in_date
      t.datetime :check_out_date
      t.integer :trip_id

      t.timestamps
    end
  end
end
