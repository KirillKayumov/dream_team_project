class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])

    if user.add_follower(current_user)
      redirect_to users_path
    else
      redirect_to :back
    end
  end
end
