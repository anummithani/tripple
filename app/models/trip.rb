class Trip < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :trip_name, :presence => true

  # Scopes

  def to_s
    city
  end

end
