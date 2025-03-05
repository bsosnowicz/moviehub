class CheckoutsController < ApplicationController
  before_action :set_funding, only: [:show]

  def show
    @funding = Funding.find(params[:id]) 
    @checkout_session = current_user
      .payment_processor
      .checkout(
        mode: 'payment',
        line_items: [{ price: 'price_1QwYDWQvbebYZKm7fooFKsXO', quantity: 1 }],
        success_url: "#{checkout_success_url}?funding_id=#{@funding.id}"
      )
  end

  def success
    session_id = params[:stripe_checkout_session_id] 
    stripe_session = Stripe::Checkout::Session.retrieve(session_id)
    line_items = Stripe::Checkout::Session.list_line_items(session_id)
  
    funding_id = params[:funding_id]
    @funding = Funding.find_by(id: funding_id)
    
    amount = line_items.data.first.amount_total / 100.0 if line_items.data.any?
  
    if stripe_session.status == "complete" && stripe_session.payment_status = "paid"
      @payment = @funding.payment.create(
        user_id: current_user.id,
        amount: amount,
        status: "success",
        funding_id: @funding.id 
      )
      
      flash[:notice] = "Payment went through"
    else
      flash[:alert] = "Payment didn't go through or funding not found"
    end
  
    @session = stripe_session
    @line_items = line_items
  end

  private

  def set_funding
    @funding = Funding.find_by(id: params[:funding_id])
  end
end
