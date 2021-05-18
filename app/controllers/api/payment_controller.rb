class Api::PaymentController < ApiController
    before_action :set_payment, only: [:show, :update, :destroy]
    load_and_authorize_resource 

    def show
      binding.pry
      render json: @payment
    end

    private
    def set_payment
      @payment = Payment.find(params[:id])
    end

end
