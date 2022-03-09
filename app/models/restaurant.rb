class Restaurant < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :time, :presence => true

  validates :trip_id, :presence => true

  # Scopes

  def to_s
    name
  end

end
