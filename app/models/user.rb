class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :favorites
  has_many :activities, through: :favorites
  has_many :messages
  has_many :reviews
  has_many :activities
  has_one :profile, dependent: :destroy
  after_create :create_profile

  # def favorited?(activity)
  #   @current_user.favorites.favorite_activities.include?(activity)
  # end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # has_one_attached :photo

  private

  def create_profile
    Profile.create(user: self)
  end

end
