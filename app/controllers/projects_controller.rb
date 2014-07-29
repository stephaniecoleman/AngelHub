class ProjectsController < ApplicationController

  # -defined by CanCanCan
  load_and_authorize_resource

  def new
    # @project loaded by #load_and_authorize_resource
  end

  def create
    @project = Project.create(project_params)
    title = project_params[:title].strip.gsub(' ', '_').downcase
    @project.create_repo(title)
  end

  def index
    
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :status)
    end
end
