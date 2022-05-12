class Review < ApplicationRecord
  belongs_to :purchase
  validates :comment, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
