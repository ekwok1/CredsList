class UsersController < ApplicationController

  # admin new
  def index
    @users = User.all
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update user_params
    redirect_to @user
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :profilepic_url)
  end
end
