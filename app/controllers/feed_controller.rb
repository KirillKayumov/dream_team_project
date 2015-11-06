class FeedController < ApplicationController
  before_action :authenticate_user!

  expose(:posts) { Post.where(user: current_user.following).ordered }

  def index
  end
end
