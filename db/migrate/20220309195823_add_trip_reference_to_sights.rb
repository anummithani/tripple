class AddTripReferenceToSights < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :sights, :trips
    add_index :sights, :trip_id
    change_column_null :sights, :trip_id, false
  end
end
