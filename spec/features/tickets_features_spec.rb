require 'rails_helper'

feature 'tickets' do
  before :each do
    @admin = create(:admin)
    @project = create(:project)
    @ticket = create(:ticket)

    #sign_in :user
    
    visit new_user_session_path
      
    fill_in 'user_email', :with => @admin.email
    fill_in 'user_password', :with => 'password'
      
    click_button 'Log in'
  end
  
  describe 'user adds a new ticket to existing project' do
    it 'user sees page with the new ticket' do
      visit project_path(@project)
      
      click_link 'Add a ticket to this project'
      
      fill_in 'ticket_name', :with => @ticket.name
      fill_in 'ticket_description', :with => @ticket.description
      select @ticket.get_priority, :from => 'ticket_priority'
      select @ticket.get_difficulty, :from => 'ticket_difficulty'
      select @ticket.get_status, :from => 'ticket_status'
      
      click_button 'Create Ticket'
      
      expect(page.current_url).to eq 'http://www.example.com/projects/' + @project.id.to_s + '/tickets/' + @project.tickets.last.id.to_s
      expect(page).to have_content(@ticket.name)
      expect(page).to have_content(@ticket.description)
      expect(page).to have_content(@project.name)
    end
  end
  
  describe 'user views specific ticket' do
    it 'user sees page with ticket name, description' do
      visit project_ticket_path(@ticket.project_id, @ticket)
      
    end
  end
end