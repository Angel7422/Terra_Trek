class Activity < ApplicationRecord
  has_many :bookings
  has_many :favorites

  belongs_to :user

  has_many_attached :pictures

  # validates :name
  # validates :address
  # validates :description
  # validates :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORIES = ["Parcs", "Expériences", "Activites Nautiques", "Spectacles", "Visites", "Pour les enfants", "Producteurs", "Musées", "Excursions", "Communaute", "Artisans"]
end
