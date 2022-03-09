class TripPhoto < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :image, :presence => true

  validates :trip_id, :presence => true

  validates :uploading_user_id, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
