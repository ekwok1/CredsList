class SessionsController < ApplicationController
  def home
    @items = Item.all.order(id: :desc)
  end

  def signup
    @user = User.new
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
       found_user = User.where(email: params[:email]).first
       if found_user && found_user.authenticate(params[:password])
         session[:id] = found_user.id
         redirect_to user_path(found_user), flash: {success: "Welcome back #{found_user.email}!"}
       else
         flash[:alert] = "Incorrect email or password"
         redirect_to login_path
       end
     else
       flash[:alert] = "Please enter an email and password"
       redirect_to login_path
     end
  end

  def new
  end


end
