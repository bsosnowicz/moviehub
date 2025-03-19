class StripeWebhooksController < ApplicationController
  allow_unauthenticated_access only: [:webhook]
  skip_before_action :verify_authenticity_token

  def webhook
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials.dig(:stripe, :webhook_secret)
      )
    rescue JSON::ParserError, Stripe::SignatureVerificationError => e
      return head :bad_request
    end

    case event.type
    when 'checkout.session.completed'
      handle_successful_payment(event.data.object)
    end

    head :ok
  end

  private

  def handle_successful_payment(session)
    begin

      user = User.find_by(stripe_customer_id: session.customer)
      if user.nil?
        user = User.find_by(email: session.customer_details.email)
        user.update!(stripe_customer_id: session.customer)
      end
  
      
      funding = Funding.find_by(id: session.metadata.funding_id)
  
      amount = session.amount_total.to_f / 100
  
      payment = Payment.create!(
        user_id: user.id,
        funding_id: funding.id,
        amount: amount,
        status: 'success'
      )
  
    rescue StandardError => e
      Rails.logger.error("Error processing payment: #{e.message}")
      Rails.logger.error(e.backtrace.join("\n"))
      raise
    end
  end
  
end
