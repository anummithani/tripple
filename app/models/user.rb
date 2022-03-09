class User < ApplicationRecord
  mount_base64_uploader :profile_picture, ProfilePictureUploader

  include JwtToken
  # Direct associations

  has_many   :trip_photos,
             foreign_key: "uploading_user_id",
             dependent: :destroy

  has_many   :recieved_friend_requests,
             class_name: "FriendRequest",
             foreign_key: "recepient_id",
             dependent: :destroy

  has_many   :sent_friend_requests,
             class_name: "FriendRequest",
             foreign_key: "sender_id",
             dependent: :destroy

  has_many   :travelled_trips,
             class_name: "Traveler",
             dependent: :destroy

  # Indirect associations

  has_many   :friends,
             through: :recieved_friend_requests,
             source: :sender

  has_many   :friends,
             through: :sent_friend_requests,
             source: :recepient

  has_many   :trips,
             through: :travelled_trips,
             source: :trip

  # Validations

  validates :name, presence: true

  validates :profile_picture, presence: true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
