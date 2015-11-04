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

  def create
    @user = User.find params[:user_id]
    @item = @user.items.build item_params
    if @item.save
      redirect_to user_items_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :pic_url, :description, :price)
  end
end
