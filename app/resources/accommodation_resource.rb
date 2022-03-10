class AccommodationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :check_in_date, :datetime
  attribute :check_out_date, :datetime
  attribute :trip_id, :integer

  # Direct associations

  belongs_to :trip

  # Indirect associations
end
