class Review < ApplicationRecord
  belongs_to :purchase
  validates :comment, presence: true
  validates :rating, presence: true
end
