class ReactionsController < ApplicationController
  expose(:reaction, attributes: :reaction_params)

  def create
    reaction.user = current_user
    reaction.save
    redirect_to object
  end

  private

  def reaction_params
    params.require(:reaction).permit(:reactive_id, :reactive_type, :positive)
  end

  def object
    case params[:reaction][:reactive_type]
    when "Post"
      Post.find(params[:reaction][:reactive_id])
    when "Comment"
      Comment.find(params[:reaction][:reactive_id]).post
    end
  end
end
