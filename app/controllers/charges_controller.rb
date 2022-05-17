class ChargesController < ApplicationController
  before_action :amount_to_be_charged, except: :thanks
  # before_action :delete_cart, only: :thanks

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)

    customer = StripeTool.create_customer(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = StripeTool.create_charge(
      customer_id: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer'
    )
    @charge.user = current_user
    @charge.save
    @charge.add_products(current_user)
    destroy_cart
    redirect_to thanks_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
    order_value
  end

  private

  def amount_to_be_charged
    @amount = set_cart.total_cents.to_i
  end

  def order_value
    @amount = set_charge.total_cents.to_f
  end

  def description
    @description = "Some amazing product"
  end

  def destroy_cart
    set_cart.destroy
  end

  def set_cart
    @cart = current_user.carts.first
  end

  def set_charge
    @charge = current_user.charges.last
  end

  def charge_params
    params.require(:charge).permit(
      :first_name,
      :last_name,
      :delivery_address,
      :additional_address,
      :phone_number
    )
  end
end
