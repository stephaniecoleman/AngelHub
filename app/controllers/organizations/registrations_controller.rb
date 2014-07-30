class Organizations::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def create
    build_resource(sign_up_params)

    resource_saved = resource.save
    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        redirect_to root_path
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
        redirect_to root_path
      end
    else
      clean_up_passwords resource
      flash[:alert] = "Please try to sign up again."
      redirect_to root_path
    end
  end

  protected
 
  # custom fields are :name, :description, :url
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |params|
      params.permit(:name, :description, :url,
        :email, :password, :password_confirmation, :avatar, :remote_image_url)
    end

    devise_parameter_sanitizer.for(:account_update) do |params|
      params.permit(:name, :description, :url,
        :email, :password, :password_confirmation, :current_password, :avatar, :remote_avatar_url)
    end
  end
end