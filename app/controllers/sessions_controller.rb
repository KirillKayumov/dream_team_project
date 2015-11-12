class SessionsController < Devise::SessionsController
  protected

  def auth_options
    { scope: resource_name, recall: "pages#home" }
  end
end
