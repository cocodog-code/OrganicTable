require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  render_views

  before do
    get :about
  end

  describe "GET #about" do
    it "returns http success" do
      expect(response).to have_http_status(200)
    end

    it 'has the right title' do
      assert_select "title", "About | #{Constants::BASE_TITLE_NAME}"
    end
  end
end
