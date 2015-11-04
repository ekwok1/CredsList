class PasswordResetsController < ApplicationController
    before_action :prevent_login_signup, only: [:edit, :update]
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      Reset.password_reset(user).deliver_now
      redirect_to login_path, notice: "Email sent"
    else
      flash.now[:alert] = "Email not found"
      render :new
    end
  end

  def edit
    if User.find_by_token params[:token]
    else
      redirect_to login_path, alert: "Invalid reset token"
    end
  end

  def update
    user = User.find_by_token params[:token]
    if user && user.reset_password!(params[:user][:password])
      session[:user_id] = user.id
      redirect_to users_path, flash: {success: "Password updated."}
    else
      redirect_to login_path, alert: "Invalid reset token"
    end
  end

  private
  def user_params
    params.require(:user).permit(:password)
  end
end
