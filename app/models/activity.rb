class Activity < ApplicationRecord
  has_many :bookings
  has_many :favorites

  belongs_to :user

  has_one_attached :photo

  # validates :name
  # validates :address
  # validates :description
  # validates :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORIES = ["Skiing"]
end
