class User < ApplicationRecord
  validates :first_name, :address, :email, presence: true
  validates :email, uniqueness: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo
  has_many :plants, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :charges, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avg_user_rating
    total = 0
    count = 0
    self.plants.each do |plant|
      plant.purchases.each do |purchase|
        if purchase.review.present?
          total += purchase.review.rating
          count += 1
        end
      end
    end
    if count == 0
      return 0
    else
      return total / count
    end
  end
end
