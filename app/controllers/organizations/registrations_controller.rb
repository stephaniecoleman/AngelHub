class Organizations::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters


  protected
 
  # custom fields are :name, :description, :url
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |params|
      params.permit(:name, :description, :url,
        :email, :password, :password_confirmation, :avatar)
    end

    devise_parameter_sanitizer.for(:account_update) do |params|
      params.permit(:name, :description, :url,
        :email, :password, :password_confirmation, :current_password, :avatar)
    end
  end
end