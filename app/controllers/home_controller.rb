class HomeController < ApplicationController
  def index
    if organization_signed_in? || developer_signed_in?
      redirect_to developers_path
    else
      redirect_to action: 'new', controller: 'devise/registrations'
    end
  end
end
