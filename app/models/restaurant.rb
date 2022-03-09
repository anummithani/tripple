class Restaurant < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :trip_id, :presence => true

  # Scopes

  def to_s
    name
  end

end
