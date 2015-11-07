module ApplicationHelper
  def body_tag(&block)
    options = {}
    options[:style] = "background-image: url(#{@user.wallpaper_url});" if @user.present?

    content_tag :body, options, &block
  end
end
