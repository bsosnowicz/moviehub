class FundingsController < ApplicationController
  before_action :set_funding, only: %i[ show edit update destroy ]

  # GET /fundings or /fundings.json
  def index
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

    @fundings = Funding.all
    @objects = Stripe::Product.list({limit: 3})
    @payments_amounts = Payment.group(:funding_id).sum(:amount) || {}
  end

  # GET /fundings/1 or /fundings/1.json
  def show
    Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

    @funding = Funding.find(params[:id])
    @payments = Payment.where(funding_id: @funding.id)
    @payments_amounts = Payment.group(:funding_id).sum(:amount) || {}
    @payments_counter = @payments.count
    @payments_user = User.joins(:payments).where(payments: { funding_id: @funding.id }).select("users.email_address, payments.amount")
    @stripe_product = Stripe::Product.retrieve(@funding.stripe_product_id)
    @stripe_price = @stripe_product.default_price
    
    @checkout_session = current_user
      .payment_processor
      .checkout(
        mode: 'payment',
        line_items: [{ price: @stripe_price, quantity: 1 }],
        success_url: "#{checkout_success_url}?funding_id=#{@funding.id}",
        metadata: { funding_id: @funding.id, user_id: current_user.id }
      )
  end
  

  # GET /fundings/new
  def new
    @funding = Funding.new
  end

  # GET /fundings/1/edit
  def edit
  end

  # POST /fundings or /fundings.json
  def create
    @funding = Funding.new(funding_params)
    @funding.user = current_user

    
    if @funding.save
      stripe_product = Stripe::Product.create({
        name: @funding.title,
        description: @funding.description,
        images:  ['https://www.science.org/do/10.1126/science.opms.aav3708/abs/14septfacultylead.jpg'],
        default_price_data: {
          currency: 'pln',
          unit_amount:(@funding.stripe_single_price.to_f * 100).to_i
        }
      })

      @funding.update(stripe_product_id: stripe_product.id)
      @funding.update(image_url: 'https://www.science.org/do/10.1126/science.opms.aav3708/abs/14septfacultylead.jpg')
    end 

    respond_to do |format|
      if @funding.save
        format.html { redirect_to @funding, notice: "Funding was successfully created." }
        format.json { render :show, status: :created, location: @funding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fundings/1 or /fundings/1.json
  def update
    respond_to do |format|
      if @funding.update(funding_params)
        format.html { redirect_to @funding, notice: "Funding was successfully updated." }
        format.json { render :show, status: :ok, location: @funding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fundings/1 or /fundings/1.json
  def destroy
    @funding.destroy!

    respond_to do |format|
      format.html { redirect_to fundings_path, status: :see_other, notice: "Funding was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding
      @funding = Funding.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def funding_params
      params.require(:funding).permit( :title, :description, :goal_amount, :user_id, :image_url, :stripe_single_price )
    end
end
