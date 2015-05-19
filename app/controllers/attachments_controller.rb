class AttachmentsController < ApplicationController
  
  def show
    @attachment = Attachment.find(params[:id])
    send_file @attachment.attachedfile.path, :type => @attachment.attachedfile_content_type, :disposition => 'inline'
  end
  
  def create
    @project = Project.find(params[:project_id])
    @ticket = @project.tickets.find(params[:ticket_id])
    @attachment = @ticket.attachments.create(attachments_params)
    
    @attachment.filetype = (@attachment.attachedfile_content_type.grep(/image/) == [] ? 'doc' : 'image')
    @attachment.save
    
    redirect_to edit_project_ticket_path(@project, @ticket)
  end
  
  def destroy
    
  end
  
  private
  def attachments_params
    params.require(:attachment).permit(:attachedfile)
  end
end
