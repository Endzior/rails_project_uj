require 'rails_helper'

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  
  before :each do
    @user = create(:user)
    @admin = create(:admin)
  end
  
  describe 'full name' do
    it 'returns user full name' do
      expect(@user.full_name).to eq @user.first_name + ' ' + @user.last_name
    end
  end
  
  describe 'admin?' do
    it 'checks user privileges' do
      expect(@user.admin).to eq false
      expect(@admin.admin).to eq true
    end
  end
end