require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe "GET #show" do
    let(:store) { create(:store) }

    it "returns http success" do
      get :show, params: { id: store.id }
      expect(response).to have_http_status 200
    end
  end
end
