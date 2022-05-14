module StripeTool
  def self.create_customer(email: customer_email, source: stripe_token)
    Stripe::Customer.create(
      email: email,
      source: source
    )
  end

  def self.create_charge(customer_id: cust_id, amount: amount_cents, description: descrip)
    Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: description,
      currency: 'usd'
    )
  end
end
