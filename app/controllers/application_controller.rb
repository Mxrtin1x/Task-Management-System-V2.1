class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # Permit the username parameter along with the default ones (email, password)
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])  # For sign-up
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username ])  # For account update
  end

  # Redirect to the tasks page after sign-in
  def after_sign_in_path_for(resource)
    tasks_path  # Redirect to tasks#index (task dashboard)
  end

  # Redirect to the authentication page after sign-out
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path  # Redirect to Devise's login page
  end
end
