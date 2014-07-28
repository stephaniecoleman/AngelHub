class GithubCallbacksController < Devise::OmniauthCallbacksController

  def github
    @dev = Developer.from_omniauth(request.env["omniauth.auth"])
    if @dev.persisted?
      sign_in_and_redirect @dev, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      redirect_to root_path
    end
  end

end
