class ItemsController < ApplicationController

  before_action :confirm_logged_in

  def index
    @user = User.find params[:user_id]
    @items = Item.where(user_id: @user.id)
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find params[:user_id]
    @item = @user.items.build item_params
    if @item.save
      redirect_to user_items_path, flash: {success: "Successfully created listing"}
    else
      render :new
    end
  end

  def show
    @item = Item.find params[:id]
  end

  def edit
    @item = Item.find params[:id]
    @user = @item.user
  end

  def update
    @item = Item.find params[:id]
    @item.update item_params
    if @item.save
      redirect_to root_path, flash: {success: "Successfully updated listing"}
    else
      render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:name, :pic_url, :description, :price)
  end
end
