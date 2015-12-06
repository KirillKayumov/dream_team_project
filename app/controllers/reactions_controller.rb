class ReactionsController < ApplicationController
  expose(:reaction, attributes: :reaction_params)

  def create
    reaction.user = current_user

    ActiveRecord::Base.transaction do
      existing_reaction = current_user.reaction_to(reaction.reactive)
      existing_reaction.destroy if existing_reaction.present?

      reaction.save!
    end

    render_fragments
  end

  def destroy
    reaction.destroy
    render_fragments
  end

  private

  def reaction_params
    params.require(:reaction).permit(:reactive_id, :reactive_type, :positive)
  end

  def redirect_object(reactive)
    reactive.is_a?(Post) ? reactive : reactive.post
  end

  def render_fragments
    render partial: "reactions/reactions", locals: { resource: reaction.reactive }
  end
end
