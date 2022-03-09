class RestaurantResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :trip_id, :integer
  attribute :date, :date
  attribute :time, :string

  # Direct associations

  belongs_to :trip

  # Indirect associations
end
