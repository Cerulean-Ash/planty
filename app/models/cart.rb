class Cart < ApplicationRecord
  has_many :purchases, dependent: :destroy
end
