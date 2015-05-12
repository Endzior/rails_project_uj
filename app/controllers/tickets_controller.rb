class TicketsController < ApplicationController
  ## shows all tickets said user is part of
  def list
    
  end
  
  def new
    @project = Project.find(params[:project_id])
  end
  
  def show
    
  end
  
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.create(ticket_params)
    redirect_to project_ticket_path(@project.id, @ticket)
    
  end
  
  def destroy
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(ticket_params)
    @ticket.destroy
    redirect_to project_path(@project)
  end
  
  private
  def ticket_params
    params.require(:ticket).permit(:name, :description, :priority, :difficulty, :status)
  end
end
