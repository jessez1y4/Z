class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  after_filter :store_location

  def store_location
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users\/sign_/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email, :full_name, :password)
    end
  end
end
