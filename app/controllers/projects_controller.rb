class ProjectsController < ApplicationController
  # -defined by CanCanCan
  load_and_authorize_resource

  def new
    # @project loaded by #load_and_authorize_resource
  end

  def create
    @project = Project.new(project_params)
    current_user.projects << @project
    new_repo = @project.create_repo(repo_parameters)
    @project.repository = new_repo[:html_url]
    @project.save
    redirect_to project_path(@project)
  end

  def index
     @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def search
    @projects = Project.search(params[:search]).limit(4)
    respond_to do |format|
      format.js
    end
  end

  def destroy
      @project.destroy
      redirect_to root_path
  end

  def update_progress
    @project = Project.find(params[:id])
    @project.progress
    redirect_to project_path(@project)
  end

  private

    def project_params
      params.require(:project).permit(:title, :description, :status, :project_pic, :location)
    end

    def repo_parameters
      url = current_user.url
      title = project_params[:title].strip.gsub(' ', '_').downcase
      description = project_params[:description]
      return {url: url, title: title, description: description}
    end
end
