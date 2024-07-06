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

  private

  def create_profile
    Profile.create(user: self)
  end

end
