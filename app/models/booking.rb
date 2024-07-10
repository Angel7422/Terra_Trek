class Booking < ApplicationRecord
  has_many :reviews

  belongs_to :activity
  belongs_to :user

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :adults, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :children, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def duration_in_days
    (end_date.to_date - start_date.to_date).to_i + 1
  end

  def total_price
    duration_in_days * activity.price
  end
end
