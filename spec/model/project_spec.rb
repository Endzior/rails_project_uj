require 'rails_helper'

describe Project do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  
  before :each do
    @project_without_tickets = create(:project)
    @project_with_5_tickets = create(:project_with_tickets)
    @project_with_100_tickets = create(:project_with_tickets, tickets_count: 100)
  end
end