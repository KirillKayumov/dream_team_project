class PagesController < ApplicationController
  before_action :redirect_to_feed, only: :home

  expose(:user) { User.new }

  def home
  end

  private

  def redirect_to_feed
    redirect_to feed_path if user_signed_in?
  end
end
