class ApplicationController < ActionController::Base
  secure_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_fliter.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_fliter.permit(:account_update, keys: [:name, :email, :password, :current_password])
  end
end
