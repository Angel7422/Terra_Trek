class Activity < ApplicationRecord
  has_many :bookings
  has_many :favorites

  belongs_to :user

  has_one_attached :photo
end
