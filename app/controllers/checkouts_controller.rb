class CheckoutsController < ApplicationController
  before_action :set_funding, only: [:show]

  def show
    @funding = Funding.find(params[:id]) 

    stripe_product = Stripe::Product.retrieve(@funding.stripe_product_id)
    stripe_price = stripe_product.default_price

    @checkout_session = current_user
      .payment_processor
      .checkout(
        mode: 'payment',
        line_items: [{ price: stripe_price, quantity: 1 }],
        success_url: "#{checkout_success_url}?funding_id=#{@funding.id}",
        metadata: { funding_id: @funding.id }
      )

    redirect_to @checkout_session.url, allow_other_host: true
  end

  def success
    session_id = params[:stripe_checkout_session_id]
    funding_id = params[:funding_id]
    @funding = Funding.find_by(id: funding_id)

    if @funding
      @payments = Payment.where(funding_id: @funding.id)
      @payments_amounts = Payment.group(:funding_id).sum(:amount) || {}
      @payments_counter = @payments.count

      @session = Stripe::Checkout::Session.retrieve(session_id)
      @line_items = Stripe::Checkout::Session.list_line_items(session_id).data
    else
      flash[:alert] = "Funding not found. Please contact support."
    end

    render 'checkouts/success'
  end

  private

  def set_funding
    @funding = Funding.find_by(id: params[:funding_id])
  end
end
