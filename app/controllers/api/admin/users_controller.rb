class Api::Admin::UsersController < ApiController
    before_action :set_user, only: [:show, :update, :destroy]
    load_and_authorize_resource 
    
    def index
      @users = User.all
      render json: @users
    end

    def create
      @user = User.new(create_params)
      if @user.save
        render json: "Confirmation e-mail has been sent. Please check user's e-mail."
      else
        render json: { errors: @user.errors }
      end
    end

    def show
      render json: @user
    end

    def update
      if @user.update_attributes(update_params)
        render json: @user
      else
        render json: { errors: @user.errors }
      end
    end

    def destroy
      if @user.destroy
        render json: "User have been successfully deleted"
      else
        render json: { errors: @user.errors }
      end
    end
    
    private
    def set_user
      @user = User.find(params[:id])
    end

    def create_params
      params.permit(:email, :password, :password_confirmation, :role)
    end

    def update_params
      params.permit(:email, :role)
    end

end