class ChargesController < ApplicationController


def new
end

def create
@cart = current_cart
  # Amount in cents. See http://stackoverflow.com/questions/12546643/get-price-in-cents-for-stripe. "to_i" strips decimals from price.
  @amount = (@cart.total_price * 100).to_i

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end


end
