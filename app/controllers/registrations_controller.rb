class RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      unless resource.persisted?
        render partial: "pages/sign_up_form", locals: { user: resource }, status: :unprocessable_entity
        return
      end
    end
  end

  protected

  def after_update_path_for(_)
    edit_user_registration_path
  end
end
