class Trip < ApplicationRecord
  mount_base64_uploader :trip_image, TripImageUploader

  # Direct associations

  has_many   :sights,
             dependent: :destroy

  has_many   :accommodations,
             dependent: :destroy

  has_many   :trip_photos,
             dependent: :destroy

  has_many   :restaurants,
             dependent: :destroy

  has_many   :travellers,
             class_name: "Traveler",
             dependent: :destroy

  # Indirect associations

  has_many   :users,
             through: :travellers,
             source: :user

  # Validations

  validates :arrival_date, presence: true

  validates :city, presence: true

  validates :country, presence: true

  validates :departure_date, presence: true

  validates :trip_image, presence: true

  validates :trip_name, presence: true

  # Scopes

  def to_s
    city
  end
end
