class Trip < ApplicationRecord
  # Direct associations

  has_many   :travellers,
             :class_name => "Traveler",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :arrival_date, :presence => true

  validates :city, :presence => true

  validates :country, :presence => true

  validates :departure_date, :presence => true

  validates :trip_image, :presence => true

  validates :trip_name, :presence => true

  # Scopes

  def to_s
    city
  end

end
