class ReactionsController < ApplicationController
  expose(:reaction, attributes: :reaction_params)

  def create
    reaction.user = current_user
    reaction.save
    redirect_to post_path(params[:reaction][:reactive_id])
  end

  private

  def reaction_params
    params.require(:reaction).permit(:reactive_id, :reactive_type, :positive)
  end
end
