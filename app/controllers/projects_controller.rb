class ProjectsController < ApplicationController
  #views
  def index
    @projects = Project.all.order('updated_at DESC')
    @project_counters = [[]]
    @projects.each do |p|
      @tickets = p.tickets.all
      count_tickets
      @project_counters[p.id] = [@counter_active, @counter_finished, @counter_cancelled]
    end
  end
  
  def new
    @project = Project.new
  end
  
  def show
    @project = Project.find(params[:id])
    @tickets = @project.tickets.all
    
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  ###crud
  
  def create
    @user = current_user
    @project = @user.projects.create(project_params)
    redirect_to @project
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
  
  def count_tickets
    @counter_active = @counter_finished = @counter_cancelled = 0
    @tickets.pluck(:status).each do |t|
      if t == 1
        @counter_finished += 1
      else
        if t == 0
          @counter_active += 1
        else
          @counter_cancelled += 1
        end
      end
    end
  end
end