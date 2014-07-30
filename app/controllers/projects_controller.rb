class ProjectsController < ApplicationController

  # -defined by CanCanCan
  load_and_authorize_resource

  def new
    # @project loaded by #load_and_authorize_resource
  end

  def create
    @project = Project.create(project_params)
    current_user.projects << @project
    @project.create_repo(repo_parameters)
  end

  def index
    
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :status)
    end

    def repo_parameters
      url = current_user.url
      title = project_params[:title].strip.gsub(' ', '_').downcase
      description = project_params[:description]
      return {url: url, title: title, description: description}
    end
end
