json.extract! accommodation, :id, :name, :check_in_date, :check_out_date,
              :trip_id, :created_at, :updated_at
json.url accommodation_url(accommodation, format: :json)
