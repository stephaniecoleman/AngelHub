class GithubCallbacksController < Devise::OmniauthCallbacksController

  def github
    @dev = Developer.from_omniauth(request.env["omniauth.auth"])
    binding.pry
  end

end
