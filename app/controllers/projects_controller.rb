class ProjectsController < ApplicationController
  #views
  def index
    @projects = Project.all.order('updated_at DESC')
  end
  
  def new
    @project = Project.new
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  ###crud
  
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'index'
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  private
  def project_params
    params.require(:project).permit(:name, :description)
  end
end