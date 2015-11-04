class SessionsController < ApplicationController

  # the index of all the items
  def home
    binding.pry
    @items = Item.all.order(id: :desc)
  end

  def signup
    @user = User.new
  end

  # creating a new user
  def new
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Please try signing up again"
      render :signup
    end
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

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to home_path
  end



  private

  def user_params
    params.require(:user).permit(:email, :password, :profilepic_url)
  end


end
