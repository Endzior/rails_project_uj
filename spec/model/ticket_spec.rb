require 'rails_helper'

describe Ticket do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :priority }
  it { should validate_presence_of :difficulty }
  it { should validate_presence_of :status }
  it { should validate_presence_of :project_id }
  
  before :each do
    @ticket = create(:ticket)
  end
  
  describe 'get priority' do
    it 'returns priority string depending on priority integer' do
      @ticket.priority = 1
      expect(@ticket.get_priority).to eq 'very low'
      @ticket.priority = 2
      expect(@ticket.get_priority).to eq 'low'
      @ticket.priority = 3
      expect(@ticket.get_priority).to eq 'normal'
      @ticket.priority = 4
      expect(@ticket.get_priority).to eq 'high'
      @ticket.priority = 5
      expect(@ticket.get_priority).to eq 'very high'
    end
  end
  
  describe 'get difficulty' do
    it 'returns priority string depending on priority integer' do
      
    end
  end
end