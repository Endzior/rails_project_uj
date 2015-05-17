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
      expect(page).to have_content(@project_with_100_tickets.name)
      expect(page).to have_content('Tickets in total : ' + 100.to_s)
      expect(page).to have_content('© Endzior 2015')
    end
  end
end
  