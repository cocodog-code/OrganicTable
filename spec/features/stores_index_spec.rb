require 'rails_helper'

RSpec.feature "Stores index", type: :feature do
  before do
    FactoryBot.create_list(:store, 10)
  end

  scenario "index including pagination" do
    visit stores_path
    expect(page).to have_title "Organic Table"
    expect(page).to have_css "ul.pagination"
    Store.page(1).per(5) do |store|
      expect store.to have_link store.name, href: store_path(store)
    end
  end
end
