class ProjectsController < ApplicationController
  before_action :authenticate_organization!

  def new
    @project = current_organization.projects.new
  end

  def create

  end

  private

    # def projects_params
    #   params
    # end
end
