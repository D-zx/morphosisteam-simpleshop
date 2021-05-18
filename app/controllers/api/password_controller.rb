class Api::PasswordController < ApiController
    
    def change_password
        @user = current_user
        if @user.valid_password?(password_params[:old_password])
            if @user.update(password: password_params[:password])
                render json: "Password have been changed successfully"
            else
                render json: @user.errors
            end
        else
            render json: "Invalid Old Password"
        end
    end
    
    private
    def password_params
      params.permit(:old_password, :password, :password_confirmation)
    end
end