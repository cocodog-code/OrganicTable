require 'rails_helper'

RSpec.describe "Store", type: :request do
  describe "GET #new" do
    before do
      get store_registration_url
    end

    it "returns http success" do
      expect(response).to have_http_status 200
    end

    it "has the correct title" do
      expect(response.body).to include "レストラン新規登録 | Organic Table"
    end
  end

  describe "GET #show" do
    let(:store) { create(:store) }

    before do
      get store_url(store)
    end

    it "returns http success" do
      expect(response).to have_http_status 200
    end

    it "has the correct title" do
      expect(response.body).to include "#{store.name} | Organic Table"
    end
  end

  describe "Post #create" do
    context "enter an invalid values" do
      let(:invalid_params) { attributes_for(:store, name: '') }

      it "does not add a store " do
        expect do
          post stores_path, params: { store: invalid_params }
        end.to change(Store, :count).by(0)
      end
    end

    context "enter valid values" do
      let(:valid_params) { attributes_for(:store) }

      it "adds a store" do
        expect do
          post stores_path, params: { store: valid_params }
        end.to change(Store, :count).by(1)
      end

      context "adds a store" do
        subject { response }

        before { post stores_path, params: { store: valid_params } }

        it { is_expected.to redirect_to store_path(Store.last) }
        it { is_expected.to have_http_status 302 }
      end
    end
  end

  describe "GET #edit" do
    let(:store) { create(:store) }

    before do
      get edit_store_url(store)
    end

    it "returns http success" do
      expect(response).to have_http_status 200
    end

    it "has the correct title" do
      expect(response.body).to include "レストラン情報更新 | Organic Table"
    end
  end
end
