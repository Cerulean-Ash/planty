class Review < ApplicationRecord
  belongs_to :purchase
  validates :comment, presence: true
  validates :rating, presence: true
  validates :purchase_id, uniqueness: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
