class Api::RegistrationsController < Devise::RegistrationsController
    respond_to :json
    def create
      @user = User.new(sign_up_params)
      if @user.save
        render json: "Confirmation e-mail has been sent. Please check your e-mail."
      else
        render json: { errors: @user.errors }
      end
    end
    
    private
    def sign_up_params
      params.permit(:email, :password, :password_confirmation)
    end
end