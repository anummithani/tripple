class TripResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :city, :string
  attribute :country, :string
  attribute :trip_name, :string
  attribute :trip_image, :string
  attribute :arrival_date, :date
  attribute :departure_date, :date

  # Direct associations

  has_many   :sights

  has_many   :restaurants

  has_many   :travellers,
             resource: TravelerResource

  # Indirect associations

end
