module ApplicationHelper
  def body_tag(&block)
    options = {}
    options[:style] = "background-image: url(#{@user.wallpaper_url});" if @user.present?

    content_tag :body, options, &block
  end

  def reaction_tag(value, resource)
    reaction = current_user.reaction_to(resource)

    if value
      term = resource.user.term_for_positive_reaction
      count = resource.reactions.positive.count
    else
      term = resource.user.term_for_negative_reaction
      count = resource.reactions.negative.count
    end

    partial = reaction.present? && reaction.positive == value ? "delete" : "form"

    render "reactions/#{partial}",
      resource: resource,
      value: value,
      reaction: reaction,
      term: term,
      count: count
  end
end
