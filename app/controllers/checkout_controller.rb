class CheckoutController < ApplicationController

  def create
    piece = Piece.find(params[:id])

    if piece.nil?
      redirect_to root_path
      return
    end 

    @session = Stripe::Checkout::Session.create(
      payment_method_types: [:card],
      line_items: [{
        name: piece.name,
        description: piece.description,
        amount: (piece.price*100).to_i,
        currency: 'usd',
        quantity: 1
      }],
      shipping_address_collection: {
        allowed_countries: ['US', 'CA'],
      },
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url
      )

    respond_to do |format|
      format.js
    end

  end 

  def success
  end

  def cancel
  end

end
