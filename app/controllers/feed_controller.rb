class FeedController < ApplicationController
  expose(:posts) { Post.where(user: current_user.following).ordered }

  def index
  end
end
