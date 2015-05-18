require 'rails_helper'

feature 'projects' do
  before :each do
    @project_without_tickets = create(:project)
    @project_with_5_tickets = create(:project_with_tickets)
    @project_with_100_tickets = create(:project_with_tickets, tickets_count: 100)
  end
  
  describe 'user visits projects page' do
    it 'user sees list of projects with the number of tickets it has' do
      visit projects_path
      
      expect(page).to have_content(@project_without_tickets.name)
      expect(page).to have_content("Leader : " + @project_without_tickets.user.full_name)
      expect(page).to have_content(@project_with_5_tickets.name)
      expect(page).to have_content("Leader : " + @project_with_5_tickets.user.full_name)
      expect(page).to have_content(@project_with_100_tickets.name)
      expect(page).to have_content("Leader : " + @project_with_100_tickets.user.full_name)
      expect(page).to have_content('Tickets in total : ' + 100.to_s)
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
      visit project_path(@project_with_100_tickets)
      
      @project_with_100_tickets.tickets.each do |ticket|
        expect(page).to have_content(ticket.name)
        expect(page).to have_content(ticket.get_priority)
        expect(page).to have_content(ticket.get_difficulty)
      end
    end
  end
end
  