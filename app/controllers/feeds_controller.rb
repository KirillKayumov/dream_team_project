class FeedsController < ApplicationController
  expose(:posts) { Post.where(user: current_user.following).ordered }

  def show
  end
end
