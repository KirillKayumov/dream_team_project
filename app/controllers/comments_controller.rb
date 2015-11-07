class CommentsController < ApplicationController
  expose(:post)
  expose(:comments, ancestor: :post)
  expose(:comment, attributes: :comment_params)

  def create
    comment.user = current_user
    comment.save
    redirect_to [post.user, post]
  end

  def destroy
    comment.destroy
    redirect_to [post.user, post]
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
