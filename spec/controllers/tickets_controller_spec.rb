require 'rails_helper'

describe TicketsController, :type => :controller do
  before :each do
    @ticket = create(:ticket)
  end
  
  describe 'show' do
    it 'shows a ticket' do
      get :show, :project_id => @ticket.project.id, :id => @ticket.id
      
      expect(response).to have_http_status(:success)
      expect(assigns(:ticket)).to eq @ticket
    end
  end
  
  describe 'delete' do
    it 'deletes a ticket' do
      delete :destroy, :project_id => @ticket.project.id, :id => @ticket.id
      
      expect(response).not_to have_http_status(:success)
      expect(assigns(:ticket)).to eq @ticket
    end
  end
end