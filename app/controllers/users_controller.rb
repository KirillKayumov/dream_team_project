class UsersController < ApplicationController
  expose(:users)
  expose(:posts) { current_user.posts.ordered }

  def index
  end

  def show
  end
end
