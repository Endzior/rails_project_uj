class TicketsController < ApplicationController
  ## shows all tickets said user is part of
  def list
    @projects = Project.all
    @tickets = []
    @projects.each do |p|
      @tickets[p.id] = p.tickets.all
    end
  end
  
  def new
    @project = Project.find(params[:project_id])
  end
  
  def show
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
  end
  
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.create(ticket_params)
    redirect_to project_ticket_path(@project.id, @ticket)
    
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
    @ticket.destroy
    
    redirect_to project_path(@project)
  end
  
  def update
    
  end
  
  private
  def ticket_params
    params.require(:ticket).permit(:name, :description, :priority, :difficulty, :status)

  end
end
