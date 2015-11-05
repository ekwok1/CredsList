class ItemsController < ApplicationController

  before_action :confirm_logged_in, except: [:show]

  def new
    @item = Item.new
  end

  def create
    @user = User.find params[:user_id]
    @item = @user.items.build item_params
    if @item.save
      # create a transaction sql query
      redirect_to user_path(@user), flash: {success: "Successfully created listing"}
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
      redirect_to user_path(@item.user), flash: {success: "Successfully updated listing"}
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy
    redirect_to user_path(@item.user)
  end


  private

  def item_params
    params.require(:item).permit(:name, :pic_url, :description, :price)
  end
  
end
