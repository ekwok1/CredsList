class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def prevent_loginsignup_when_logged_in
    if session[:user_id]
      redirect_to user_path(current_user), alert: "You are already logged in"
    end
  end

  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "You need to be logged in to view this page"
    end
  end

  def ensure_correct_user
    @foo = true
    @user = User.find session[:user_id]
    @item = Item.find params[:id]
    unless session[:user_id] == @item.user.id
      @foo = false
      redirect_to @user, alert: "Not authorized"
    end
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user
end
