class CommentsController < ApplicationController
  def create
    @item = Item.find params[:id]
    @comment = @item.comments.build comment_params
    if @comment.save
      @comment.update(user_id: current_user.id)
      @comment.update(first_name: User.find(id: current_user.id).first_name)
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
