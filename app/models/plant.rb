class Plant < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :purchases #, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_purchase

  private

  #  ensure that there are no purchases referencing this product
  def ensure_not_referenced_by_any_purchase
    unless purchases.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
