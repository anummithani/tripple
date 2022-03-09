class AddTripReferenceToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :restaurants, :trips
    add_index :restaurants, :trip_id
    change_column_null :restaurants, :trip_id, false
  end
end
