class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show]

  def show
    flash[:notice] = "Testing everything :P"
  end

  def checkout
  end
end
