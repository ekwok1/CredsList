class CommentsController < ApplicationController
  def create
    @item = Item.find params[:id]
    @comment = @item.comments.build comment_params
    @comment.user = current_user
    @comment.first_name = @comment.user.first_name
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @item }
        format.json { render json: @comment }
      else
        format.html { redirect_to @item }
        format.json { render json: {errors: @comment.errors.full_messages} }
      end 
    end
  end

private
  def comment_params
    params.require(:comment).permit(:comment, :user_id)
  end
end
