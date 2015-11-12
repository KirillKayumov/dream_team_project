class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      unless resource.persisted?
        render partial: "pages/sign_up_form", locals: { user: resource }
        return
      end
    end
  end
end
