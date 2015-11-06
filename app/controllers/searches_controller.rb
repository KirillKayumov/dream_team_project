class SearchesController < ApplicationController
  expose(:users) { User.search_by_name(params[:q]) }
  expose(:posts) { Post.search_by_content(params[:q]) }

  def show
  end
end
