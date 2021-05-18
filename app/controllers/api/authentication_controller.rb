class Api::AuthenticationController < ApiController
    skip_before_action :authenticate_user!, only: [:create]

    def create
      @user = User.find_by(email: params[:email])
      if @user
        puts @user
        if @user.activated?
          if @user&.valid_password?(params[:password])
              render json: { token: JsonWebToken.encode(sub: @user.id) }
          else
              render json: { errors: 'invalid password' }
          end
        else
          render json: { errors: "Account is not activated, Please check your e-mail to activate your account."}
        end
      else
        render json: { errors: "Invalid e-mail"}
      end
    end
    
    def fetch
      render json: current_user
    end
  end