class ProjectsController < ApplicationController

  # -defined by CanCanCan
  load_and_authorize_resource

  def new
    # @project loaded by #load_and_authorize_resource
  end

  def create

  end

  private

    def project_params
      params.require(:project).permit(:title, :description)
    end
end
