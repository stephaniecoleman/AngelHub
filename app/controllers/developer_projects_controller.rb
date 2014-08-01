class DeveloperProjectsController < ApplicationController

  def create 
      @project = Project.find(params[:id])
      @project.developers << current_user
      redirect_to project_path(@project)
  end
end