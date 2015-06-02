require 'rails_helper'

feature 'projects' do
  before :each do
    @project_without_tickets = create(:project)
    @project_with_5_tickets = create(:project_with_tickets)
    @project_with_20_tickets = create(:project_with_tickets, tickets_count: 20)
  end
  
  describe 'user creates a project' do
    it 'user creates a project and then sees the project he has created' do
      #sign_in :user
      @admin = create(:admin)
      visit new_user_session_path
      fill_in 'user_email', :with => @admin.email
      fill_in 'user_password', :with => 'password'
      click_button 'Log in'
      
      visit new_project_path
      
      fill_in 'project_name', :with => 'Project name'
      fill_in 'project_description', :with => 'Project description'
      click_button 'Create Project'
      
      expect(page).to have_content('Project name')
      expect(page).to have_content('Project description')
    end
  end
  
  describe 'user visits projects page' do
    it 'user sees list of projects with the number of tickets it has' do
      visit projects_path
      
      expect(page).to have_content(@project_without_tickets.name)
      expect(page).to have_content("Leader : " + @project_without_tickets.user.full_name)
      expect(page).to have_content(@project_with_5_tickets.name)
      expect(page).to have_content("Leader : " + @project_with_5_tickets.user.full_name)
      expect(page).to have_content(@project_with_20_tickets.name)
      expect(page).to have_content("Leader : " + @project_with_20_tickets.user.full_name)
      expect(page).to have_content('Tickets in total : ' + 20.to_s)
    end
  end
  
  describe 'user visits specific project page with no tickets assigned to it' do
    it 'user sees projects name, it\'s description and the leader of the project' do
      visit project_path(@project_without_tickets)
      
      expect(page).to have_content(@project_without_tickets.name)
      expect(page).to have_content(@project_without_tickets.description)
      expect(page).to have_content(@project_without_tickets.user.full_name)
      expect(page).to have_no_content('very' || 'low' || 'normal' || 'high' || 'easy' || 'hard')
    end
  end
  
  describe 'user visits specific project page with many tickets assigned to it' do
    it 'user sees projects name, it\'s description, leader of the project and many tickets' do
      visit project_path(@project_with_20_tickets)
      
      @project_with_20_tickets.tickets.each do |ticket|
        expect(page).to have_content(ticket.name)
        expect(page).to have_content(ticket.get_priority)
        expect(page).to have_content(ticket.get_difficulty)
      end
    end
  end
end
  