class ProjectsController < ApplicationController

  # before_action :set_project
  # before_action :assign_params_to_project
  # before_action :assert_permission

  load_and_authorize_resource

  def new
    # @project = current_user.projects.new
  end

  def create

  end

  private

    def project_params
      params.require(:project).permit(:title, :description)
    end

    # def set_project
    #   @project = if params[:id]
    #     Project.find(params[:id])
    #   else
    #     # limit the creation of project to only the signed in organization
    #     current_user.projects.new
    #   end
    # end

    # def assign_params_to_project
    #   if params[:project]
    #     @project.assign_attributes(project_params)
    #   end
    # end

    # def assert_permission
    #   # redirect if user is not permitted
    #   if cannot? action_name, @project
    #     redirect_to root_path
    #   end
    # end
end
