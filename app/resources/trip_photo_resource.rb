class TripPhotoResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :image, :string
  attribute :caption, :string
  attribute :trip_id, :integer
  attribute :uploading_user_id, :integer

  # Direct associations

  # Indirect associations

end
