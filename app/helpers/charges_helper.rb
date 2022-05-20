module ChargesHelper
  def pretty_amount(amount_in_cents)
    number_to_currency(amount_in_cents.fdiv(100), unit: "£")
  end

  def items_in_cart
    num_items = 0
    current_user.carts.first.purchases.each do |purchase|
      num_items += purchase.quantity_purchased
    end
    return num_items
  rescue NoMethodError
    return num_items = 0
  end
end
