# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  render_views

  let(:user)   { User.create!(email: 'sraka@ds.com', password: '123123123') }
  let(:task)   { user.tasks.create!(title: 'Opillia') }

  let!(:item1)  { task.items.create!(item: 'buy') }
  let!(:item2)  { task.items.create!(item: 'drink') }
  let!(:item3)  { task.items.create!(item: 'enjoy') }

  before { sign_in(user) }
  after { User.all.destroy_all }

  describe 'GET /index,' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns Opillia task' do
      expect(response.body).to include(task.title)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get :show, params: { id: task.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post :create, params: { task: { title: 'New' } }

      expect(response).to have_http_status(302)
    end
  end

  describe 'PUT /update,' do
    it 'returns http success' do
      put :update, params: { id: task.id, task: { title: 'IPA' } }

      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete :destroy, params: { id: task.id }

      expect(response).to have_http_status(302)
    end
  end
end
