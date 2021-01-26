require 'rails_helper'

RSpec.feature "Stores index", type: :feature do
  before do
    FactoryBot.create_list(:store, 10)
  end

  scenario "store index info" do
    visit stores_path
    expect(page).to have_title "Organic Table"
    expect(page).to have_css "ul.pagination"
    Store.page(1).per(5).each do |store|
      expect(page).to have_link store.name, href: store_path(store)
      expect(page).to have_content store.genre
      expect(page).to have_content store.description
    end
  end
end
