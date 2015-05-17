require 'rails_helper'

describe ProjectsController, :type => :controller do
  describe 'index' do
    it 'returns projects' do
      get :index
      
      expect(response).to have_http_status(:success)
      expect(assigns(:projects).length).to eq 0
    end
  end
end