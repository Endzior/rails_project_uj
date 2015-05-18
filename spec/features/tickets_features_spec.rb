require 'rails_helper'
include Devise::TestHelpers

feature 'tickets' do
  before :each do
    @user = create(:user)
    @project = create(:project)
    @ticket = create(:ticket)
  end
  
  describe 'user adds a new ticket to existing project' do
    it 'user sees page with the new ticket' do
      visit new_user_session_path
      
      fill_in 'user_email', :with => @user.email
      fill_in 'user_password', :with => 'password'
      
      click_button 'Log in'
      
      visit project_path(@project)
      
      click_link 'Add a ticket to this project'
    end
  end
  
  describe 'user views specific ticket' do
    it 'user sees page with ticket name, description' do
      
      
    end
  end
end