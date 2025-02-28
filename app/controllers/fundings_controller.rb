class FundingsController < ApplicationController
  before_action :set_funding, only: %i[ show edit update destroy ]

  # GET /fundings or /fundings.json
  def index
    @fundings = Funding.all
  end

  # GET /fundings/1 or /fundings/1.json
  def show
    @funding = Funding.find(params[:id])
    @payments = Payment.where(funding_id: @funding.id)
    @payments_counter = @payments.count
    @payments_user = User.joins(:payments).where(payments: { funding_id: @funding.id }).select("users.id, users.email_address, payments.amount")


    @checkout_session = current_user
      .payment_processor
      .checkout(
        mode: 'payment',
        line_items: [{ price: 'price_1QwYDWQvbebYZKm7fooFKsXO', quantity: 1 }],
        success_url: "#{checkout_success_url}?funding_id=#{@funding.id}"
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
      params.expect(funding: [ :title, :description, :goal_amount, :user_id ])
    end
end
