class TripPhoto < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

  # Direct associations

  belongs_to :trip

  belongs_to :uploading_user,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :caption, :presence => true

  validates :image, :presence => true

  validates :trip_id, :presence => true

  validates :uploading_user_id, :presence => true

  # Scopes

  def to_s
    created_at
  end

end
