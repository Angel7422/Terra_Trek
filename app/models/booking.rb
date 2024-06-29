class Booking < ApplicationRecord
  has_many :reviews

  belongs_to :activities
  belongs_to :users

  validates :start_date, presence: true
  validates :end_date, presence: true
end
