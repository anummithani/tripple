class CreateTripPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :trip_photos do |t|
      t.string :image
      t.text :caption
      t.integer :trip_id
      t.integer :uploading_user_id

      t.timestamps
    end
  end
end
