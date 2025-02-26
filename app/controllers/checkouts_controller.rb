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

  end
end
