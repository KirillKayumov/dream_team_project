class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])

    if user.add_follower(current_user)
      redirect_to user
    else
      redirect_to :back
    end
  end

  def destroy
    user = User.find(params[:user_id])

    if user.remove_follower(current_user)
      redirect_to user
    else
      redirect_to :back
    end
  end
end
