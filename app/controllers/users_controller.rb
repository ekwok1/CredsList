class UsersController < ApplicationController

  # admin new

  
  def edit
  end

  def show
    @User = User.find params[:id]
  end
end
