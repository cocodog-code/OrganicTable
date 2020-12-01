require 'rails_helper'

RSpec.describe "Store request", type: :request do
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

  describe "GET #index" do
    let(:store) { create(:store) }

    before do
      get stores_url
    end

    it "returns http success" do
      expect(response).to have_http_status 200
    end

    it "has the correct title" do
      expect(response.body).to include "Organic Table"
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

  describe "Patch #update" do
    let(:store) { create(:store, name: "organictable") }

    context "with invalid attribute" do
      let(:invalid_params) { attributes_for(:store, name: nil) }

      before do
        patch store_path(store), params: { id: store.id, store: invalid_params }
      end

      it "does not update a store name" do
        expect(store.reload.name).to eq "organictable"
      end

      it "returns http success" do
        expect(response).to have_http_status 200
      end

      it "renders store edit page" do
        expect(response.body).to include "レストラン情報更新 | Organic Table"
      end
    end

    context "with valid params" do
      let(:valid_params) { attributes_for(:store, name: "new_name") }

      before do
        patch store_path(store), params: { id: store.id, store: valid_params }
      end

      it "updates a store name" do
        expect(store.reload.name).to eq "new_name"
      end

      it "returns a 302 response" do
        expect(response).to have_http_status 302
      end

      it "redirects to store show page" do
        expect(response).to redirect_to store_path(store)
      end
    end
  end
end
