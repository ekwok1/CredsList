class CommentsController < ApplicationController
  def create
    @item = Item.find params[:id]
    @comment = @item.comments.build comment_params
    @current_user_id = session[:user_id]

    if @comment.save
      @comment.update(user_id: @current_user_id)
      @comment.update(first_name: (User.find_by_id(@current_user_id)).first_name)
      render json: @comment
    else
      render json: {errors: @comment.errors.full_messages}
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
