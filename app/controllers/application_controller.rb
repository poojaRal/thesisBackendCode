# Overall controller for the application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?

  skip_before_filter :verify_authenticity_token

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    dashboard_show_path
  end

  def after_sign_out_path_for(resource_or_scope)
     sign_in_path
  end

  def after_sign_up_path_for(resource_or_scope)
    admin_sign_up_path
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to sign_in_path, :notice => 'if you want to add a notice'
    end
  end
end
