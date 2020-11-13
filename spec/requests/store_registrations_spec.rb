require 'rails_helper'

RSpec.describe "StoreRegistrations", type: :request do
  describe "Post #create" do
    let(:invalid_params) { attributes_for(:store, name: '') }

    it "does not add a store " do
      expect do
        post stores_path, params: { store: invalid_params }
      end.to change(Store, :count).by(0)
    end
  end
end
