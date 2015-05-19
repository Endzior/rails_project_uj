class AttachmentsController < ApplicationController
  
  #def show
  #  @project = Project.find(params[:project_id])
  #  @ticket = @project.tickets.find(params[:ticket_id])
  #  @attachment = @ticket.attachments.find(params[:id])
  #end
  
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:ticket_id])
    attachments_params[:filetype] = (attachments_params.attached_file_content_type.grep(/image/) == [] ? 'doc' : 'image')
    @attachment = @ticket.attachments.create(attachments_params)
    
    redirect_to edit_project_ticket_path(@project, @ticket)
  end
  
  def destroy
    
  end
  
  private
  def attachments_params
    params.require(:attachment).permit(:attachedfile)
  end
end
