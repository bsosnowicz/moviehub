class CheckoutsController < ApplicationController
  def show
    Rails.logger.debug "Current User: #{current_user.inspect}"
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer_name
    
    @checkout_session = current_user
      .payment_processor
      .checkout(
        mode: 'payment',
        line_items: [{ price: 'price_1QwYDWQvbebYZKm7fooFKsXO', quantity: 1 }],
        success_url: checkout_success_url,
  )

  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:stripe_checkout_session_id])
    @line_items = Stripe::Checkout::Session.list_line_items(params[:stripe_checkout_session_id])
  end
end
