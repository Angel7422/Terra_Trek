class Booking < ApplicationRecord
  has_many :reviews

  belongs_to :activities
  belongs_to :users
end
