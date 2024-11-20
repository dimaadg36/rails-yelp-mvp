class Review < ApplicationRecord
  belongs_to :restaurant
  # creates a method review.restaurant which returns the instance of restaurant that the review belongs to
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: 0..5 }, numericality: { only_integer: true }
end
