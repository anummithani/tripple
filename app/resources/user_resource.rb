class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :profile_picture, :string

  # Direct associations

  has_many   :travelled_trips,
             resource: TravelerResource

  # Indirect associations

end
