class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]

  def show
    flash[:alert] = "User not found."
  end

  def checkout
  end
end
