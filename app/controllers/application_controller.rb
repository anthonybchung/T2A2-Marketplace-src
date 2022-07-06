class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    # Added role, to the user to differentiate Teacher and Students.
    # Added image for User profile picture.
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |user_params|
        user_params.permit(:role,:email,:user_name,:password,:image,:password_confirmation)
      end
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(:role, :email, :user_name, :password,:image, :password_confirmation, :current_password)
      end
    end

end
