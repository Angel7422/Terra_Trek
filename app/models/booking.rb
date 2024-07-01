class Booking < ApplicationRecord
  has_many :reviews

  belongs_to :activities
  belongs_to :users

  validates :start_date, presence: true
  validates :end_date, presence: true

  def duration_in_days
    (end_date.to_date - start_date.to_date).to_i + 1
  end

  def total_price
    duration_in_days * activity.price
  end
end
