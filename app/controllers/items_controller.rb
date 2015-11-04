class ItemsController < ApplicationController

  before_action :confirm_logged_in

  def index
    @user = User.find params[:user_id]
    @items = Item.where(user_id: @user.id)
  end

  def new
    @user = User.find params[:user_id]
    @item = @user.items.build
  end

  def edit
  end

  def show
  end
end
