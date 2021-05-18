class Api::ConfirmationController < Devise::RegistrationsController
    respond_to :json
    
    def show
        @user = User.confirm_by_token(params[:confirmation_token])
        if @user
            render json: "Welcome to the Sample App! Your email has been confirmed. Please sign in to continue."
        else
            render json: "User not found!!"
        end
    end
    
end