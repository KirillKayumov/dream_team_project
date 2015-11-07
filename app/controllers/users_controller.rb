class UsersController < ApplicationController
  before_action :set_user, only: :show

  expose(:users)
  expose(:user)
  expose(:posts) { user.posts.ordered }

  def index
  end

  def show
  end

  private

  def set_user
    @user = user
  end
end
