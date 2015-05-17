require 'rails_helper'

describe Ticket do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :priority }
  it { should validate_presence_of :difficulty }
  it { should validate_presence_of :status }
  it { should validate_presence_of :project_id }
  
  describe 'get priority' do
    it 'returns priority string depending on priority integer' do
      
    end
  end
end