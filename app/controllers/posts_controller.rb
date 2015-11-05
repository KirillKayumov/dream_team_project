class PostsController < ApplicationController
  expose(:post, attributes: :post_params)
  expose(:comments, ancestor: :post) { |default| default.ordered.includes(:user) }
  expose(:comment) { Comment.new }
  expose(:positive_reactions_count) { post.reactions.positive.count }
  expose(:negative_reactions_count) { post.reactions.negative.count }

  def new
  end

  def create
    post.user = current_user

    if post.save
      redirect_to current_user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if post.save
      redirect_to post
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
