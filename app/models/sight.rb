class Sight < ApplicationRecord
  # Direct associations

  belongs_to :trip

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
