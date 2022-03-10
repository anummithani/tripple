json.extract! restaurant, :id, :name, :trip_id, :datetime, :created_at,
              :updated_at
json.url restaurant_url(restaurant, format: :json)
