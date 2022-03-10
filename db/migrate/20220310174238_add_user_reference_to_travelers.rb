class AddUserReferenceToTravelers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :travelers, :users
    add_index :travelers, :user_id
    change_column_null :travelers, :user_id, false
  end
end
