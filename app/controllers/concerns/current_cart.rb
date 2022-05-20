module CurrentCart
  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create(user: current_user)
    session[:cart_id] = @cart.id
    cleanup
  end

  def cleanup
    length = current_user.carts.length
    if length > 1
      current_user.carts.each_with_index do |cart, index|
        if index < length - 1
          cart.destroy
        end
      end
    end
  end
end
