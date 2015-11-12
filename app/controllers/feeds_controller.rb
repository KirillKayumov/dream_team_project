class FeedsController < ApplicationController
  expose(:posts) { Post.where(user: current_user.following).ordered.includes(:user) }

  def show
  end
end
