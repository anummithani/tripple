class Trip < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :departure_date, :presence => true

  validates :trip_image, :presence => true

  validates :trip_name, :presence => true

  # Scopes

  def to_s
    city
  end

end
