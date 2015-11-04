class UsersController < ApplicationController

  # admin new

  def edit
  end

  def show
    @user = User.find params[:id]
  end
end
