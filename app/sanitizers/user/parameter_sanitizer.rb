class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    USER_PARAMS = %i(
      full_name
      email
      password
      password_confirmation
      avatar
      wallpaper
    )

    def sign_up
      default_params.permit(USER_PARAMS)
    end

    def account_update
      default_params.permit(
        USER_PARAMS,
        :current_password,
        :remove_avatar,
        :remove_wallpaper,
        :term_for_positive_reaction,
        :term_for_negative_reaction
      )
    end
  end
end
