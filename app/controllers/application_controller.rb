class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :breadcrumbs


  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role])
  end

  def after_sign_in_path_for(resource)
	   root_path
  end

  def after_sign_out_path_for(resource)
	   new_user_session_path
  end
end
