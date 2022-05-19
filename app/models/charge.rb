class Charge < ApplicationRecord
  belongs_to :user
  has_many :purchases
  validates :first_name, :last_name, :delivery_address, :phone_number, presence: true

  def add_products(user)
    purchases = Purchase.where(cart_id: user.carts.first.id)
    purchases.each do |plant|
      plant.charge_id = id
      plant.cart_id = nil
      plant.save
    end
  end

  def total_cents
    total = 0
    purchases.each do |plant|
      total += plant.plant.price_per_clipping * plant.quantity_purchased * 100
    end
    return total
  end
end
