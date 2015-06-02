require 'rails_helper'

describe ProjectsController, :type => :controller do
  describe 'index' do
    it 'returns projects' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:projects).length).to eq 0
    end
  end
  
  describe 'show' do
    it 'shows a project' do
      @project = create(:project)
      get :show, :id => @project.id
      
      expect(response).to have_http_status(:success)
      expect(assigns(:project)).to eq @project
    end
  end
end