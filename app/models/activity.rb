class Activity < ApplicationRecord
  has_many :bookings
  has_many :favorites
  has_many :users, through: :favorites

  belongs_to :user

  has_many_attached :pictures

  # validates :name
  # validates :address
  # validates :description
  # validates :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  CATEGORIES = ["Parcs", "Expériences", "Activites", "Spectacles", "Visites", "Pour les enfants",
                "Producteurs", "Musées", "Excursions", "Communaute", "Artisans", "Nature", "Culture", "Balades"]

  def favorite?(user)
    favorites.where(user: user).exists?
  end

  def category_icon
    case category
    when "Activites" then "fas fa-skiing"
    when "Producteurs" then "fas fa-leaf"
    when "Artisans" then "fas fa-hammer"
    when "Communaute" then "fas fa-users"
    when "Agenda" then "fa-solid fa-calendar-days"
    else
      "fas fa-utensils"
    end
  end

end
