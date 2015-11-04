class SessionsController < ApplicationController

  # the index of all the items
  def home
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
      redirect_to user_path(@user), flash: {success: "Successfully signed up!"}
    else
      render :signup
    end
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
       found_user = User.where(email: params[:email]).first
       if found_user && found_user.authenticate(params[:password])
         session[:user_id] = found_user.id
         redirect_to user_path(found_user), flash: {success: "Welcome back #{found_user.first_name}!"}
       else
         redirect_to login_path, alert: "Incorrect email or password"
       end
    else   
       redirect_to login_path, alert: "Please enter an email and password"
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out"
  end



  private

  def user_params
    params.require(:user).permit(:email, :password, :profilepic_url, :first_name, :last_name)
  end


end
