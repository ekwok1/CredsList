class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # before_action :current_user

  # def prevent_loginsignup_when_logged_in
  #   if session[:user_id]
  #     redirect_to user_path(current_user), alert: "You are already logged in"
  #   end
  # end

  # def confirm_logged_in
  #   unless session[:user_id]
  #     redirect_to login_path, alert: "You need to be logged in to buy this item"
  #   end
  # end

  helper_method :current_user

  private

  def current_user
    @current_user = nil #User.last#||= User.find(session[:user_id]) if session[:user_id]
  end
end
