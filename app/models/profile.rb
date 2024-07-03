class Profile < ApplicationRecord
  belongs_to :user

  delegate :latitude, :longitude, to: :user
end
