class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :breadcrumbs
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to doctors_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role])
  end

  def after_sign_in_path_for(resource)
	   doctors_path
  end

  def after_sign_out_path_for(resource)
	   new_user_session_path
  end
end
