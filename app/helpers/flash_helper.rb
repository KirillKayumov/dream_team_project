module FlashHelper
  def flash_message(type, content)
    render "shared/flash_message", type: type, content: content if flash[type] == content
  end
end
