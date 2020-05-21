require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  render_views

  let(:user)   { User.create!(email: 'sraka@ds.com', password: '123123123') }
  let(:task)   { user.tasks.create!(title: 'Opillia') }
  
  let!(:item1)  { task.items.create!(item: 'buy') }
  let!(:item2)  { task.items.create!(item: 'drink') }
  let!(:item3)  { task.items.create!(item: 'enjoy') }
      
  before{ sign_in(user) }
  after { User.all.destroy_all }

  describe "GET /index," do
    before { get :index }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'returns Opillia task' do
      expect(response.body).to include(task.title)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get :show, params: { id: task.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/tasks/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update," do
    it "returns http success" do
      get "/tasks/update,"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/tasks/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
