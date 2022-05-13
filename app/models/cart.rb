class Cart < ApplicationRecord
  has_many :purchases, dependent: :destroy

  def add_product(plant, quantity)
    current_item = Purchase.find_by(plant_id: plant.id, cart_id: id)
    if current_item
      if current_item.quantity_purchased == nil || current_item.quantity_purchased < 1
        current_item.quantity_purchased = 1
      end
      current_item.quantity_purchased += quantity
    else
      current_item = Purchase.new(plant_id: plant.id, cart_id: id)
      current_item.quantity_purchased = quantity
    end
    current_item
  end

end
