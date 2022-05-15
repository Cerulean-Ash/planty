class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  belongs_to :cart, optional: true
  has_one :review, dependent: :destroy
  belongs_to :charge, optional: true
end
