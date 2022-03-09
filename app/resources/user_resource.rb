class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string
  attribute :profile_picture, :string

  # Direct associations

  has_many   :trip_photos,
             foreign_key: :uploading_user_id

  has_many   :recieved_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :recepient_id

  has_many   :sent_friend_requests,
             resource: FriendRequestResource,
             foreign_key: :sender_id

  has_many   :travelled_trips,
             resource: TravelerResource

  # Indirect associations

end
