class Plant < ApplicationRecord
  validates :title, :price_per_clipping, :description, :number_of_clippings, :color, :care_type, presence: true
  validates :price_per_clipping, numericality: { greater_than_or_equal_to: 0.1 }
  validates :number_of_clippings, numericality: { greater_than: 0 }
  belongs_to :user
  has_many_attached :photos
  has_many :purchases #, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_purchase

  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :color, :care_type],
    associated_against: {
      user: [:address]
    },
    using: {
      tsearch: { prefix: true }
    }

  private

  #  ensure that there are no purchases referencing this product
  def ensure_not_referenced_by_any_purchase
    unless purchases.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end
