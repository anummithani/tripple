json.extract! trip_photo, :id, :image, :caption, :trip_id, :uploading_user_id,
              :created_at, :updated_at
json.url trip_photo_url(trip_photo, format: :json)
