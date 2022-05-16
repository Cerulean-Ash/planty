class PurchasesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def create
    quantity = params[:purchase]["quantity_purchased"].to_i
    # @purchase = Purchase.new
    # @purchase.quantity_purchased = 1
    # puts params[:quantity_purchased]
    plant = Plant.find(params[:plant_id])
    # @purchase.plant = plant
    # @purchase.cart = @cart

    @purchase = @cart.add_product(plant, quantity)

    # @purchase.quantity_purchased = params[:quantity_purchased]
    @purchase.user = current_user
    if @purchase.save
      redirect_to plant_path(plant)
    else
      redirect_to plant_path(plant)
      # render :new
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
