require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  
  before :each do
    @project_without_tickets = create(:project)
    @project_with_5_tickets = create(:project_with_tickets)
    @project_with_100_tickets = create(:project_with_tickets, tickets_count: 100)
  end
  
  describe 'count_tickets' do
    it 'returns number of tickets associated with project' do
      expect(@project_without_tickets.tickets_count).to eq 0
      expect(@project_with_5_tickets.tickets_count).to eq 5
      expect(@project_with_100_tickets.tickets_count).to eq 100
    end
  end
end