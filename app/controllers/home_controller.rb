class HomeController < ApplicationController
  def index
    if organization_signed_in?

    else
      redirect_to action: 'new', controller: 'devise/registrations'
    end
  end
end
