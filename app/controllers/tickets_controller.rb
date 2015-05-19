class TicketsController < ApplicationController
  ## shows all tickets said user is part of
  def list
    @tickets = []
    @projects = current_user.projects
    @projects.each do |project|
      @tickets[project.id] = project.tickets
    end
  end
  
  def new
    @project = Project.find(params[:project_id])
    @ticket = Ticket.new
  end
  
  def show
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
    @attachment = Attachment.new
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
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:id])
    
    if @ticket.update(ticket_params)
      redirect_to project_ticket_path(@project.id, @ticket)
    else
      render 'edit'
    end
  end
  
  private
  def ticket_params
    params.require(:ticket).permit(:name, :description, :priority, :difficulty, :status)
  end
end
