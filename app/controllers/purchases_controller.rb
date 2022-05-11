class PurchasesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def create
    @purchase = Purchase.new
    @purchase.user = current_user
    plant = Plant.find(params[:plant_id])
    @purchase.plant = plant
    @purchase.cart = @cart
    if @purchase.save
      redirect_to cart_path
    else
      render :new
    end
  end

  private

  def set_purchase
    Purchase.find(params[:id])
  end

  def find_plant
    @plant = Plant.find(params[:plant_id])
  end

end
