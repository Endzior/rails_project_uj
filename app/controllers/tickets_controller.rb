class TicketsController < ApplicationController
  
  def show
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
  end
  
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.create(ticket_params)
    redirect_to ticket_path(@ticket)
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
