class Restaurant < ApplicationRecord
  # Direct associations

  belongs_to :trip

  # Indirect associations

  # Validations

  validates :datetime, presence: true

  validates :name, presence: true

  validates :trip_id, presence: true

  # Scopes

  def to_s
    name
  end
end
