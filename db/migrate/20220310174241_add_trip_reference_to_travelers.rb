class AddTripReferenceToTravelers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :travelers, :trips
    add_index :travelers, :trip_id
    change_column_null :travelers, :trip_id, false
  end
end
