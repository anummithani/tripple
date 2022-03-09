class SightResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :date, :date
  attribute :time, :string
  attribute :trip_id, :integer

  # Direct associations

  belongs_to :trip

  # Indirect associations
end
