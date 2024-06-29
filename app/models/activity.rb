class Activity < ApplicationRecord
  has_many :bookings
  has_many :favorites

  belongs_to :user

  has_one_attached :photo

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
