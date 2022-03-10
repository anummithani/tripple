class AddTripReferenceToTripPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :trip_photos, :trips
    add_index :trip_photos, :trip_id
    change_column_null :trip_photos, :trip_id, false
  end
end
