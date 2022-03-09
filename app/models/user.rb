class User < ApplicationRecord
  # Direct associations

  has_many   :sent_friend_requests,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :travelled_trips,
             :class_name => "Traveler",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

  validates :profile_picture, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
