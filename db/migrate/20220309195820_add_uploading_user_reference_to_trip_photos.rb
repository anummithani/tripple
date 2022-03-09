class AddUploadingUserReferenceToTripPhotos < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :trip_photos, :users, column: :uploading_user_id
    add_index :trip_photos, :uploading_user_id
    change_column_null :trip_photos, :uploading_user_id, false
  end
end
