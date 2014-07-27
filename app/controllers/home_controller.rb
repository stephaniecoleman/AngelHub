class HomeController < ApplicationController
  def index
    if developer_signed_in?
      redirect_to developers_dashboard_path
    elsif organization_signed_in?
      redirect_to organization_dashboard_path
    else
      redirect_to action: 'new', controller: 'devise/registrations'
    end
  end


end
