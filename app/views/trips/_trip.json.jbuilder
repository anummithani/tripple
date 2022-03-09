json.extract! trip, :id, :city, :country, :trip_name, :trip_image, :arrival_date, :departure_date, :created_at, :updated_at
json.url trip_url(trip, format: :json)
