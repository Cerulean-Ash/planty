class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  belongs_to :cart
  has_many :reviews, dependent: :destroy
end
