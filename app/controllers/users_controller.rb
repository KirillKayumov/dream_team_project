class UsersController < ApplicationController
  expose(:users)
  expose(:user)
  expose(:posts) { user.posts.ordered }

  def index
  end

  def show
  end
end
