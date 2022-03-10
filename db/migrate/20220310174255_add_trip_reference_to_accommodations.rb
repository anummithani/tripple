class AddTripReferenceToAccommodations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :accommodations, :trips
    add_index :accommodations, :trip_id
    change_column_null :accommodations, :trip_id, false
  end
end
