class CommentsController < ApplicationController
  def create
    @item = Item.find params[:id]
    @comment = @item.comments.build comment_params
    if @comment.save
      render json: @comment
    else
      render json: {errors: @comment.errors.full_messages}
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
