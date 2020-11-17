require 'rails_helper'

RSpec.feature "Stores", type: :feature do
  context "with valud values" do
    let(:store) { FactoryBot.build(:store) }

    scenario "valid store registration" do
      visit store_registration_path
      fill_in 'store_name',    with: store.name
      fill_in 'store_genre',   with: store.genre
      fill_in 'store_phone',   with: store.phone
      fill_in 'store_access',  with: store.access
      fill_in 'store_hour',    with: store.hour
      fill_in 'store_website', with: store.website
      fill_in 'store_address', with: store.address
      click_on '新規登録'
      # ページタイトルの確認
      expect(page).to have_title "#{store.name} | Organic Table"

      # 新規登録成功時のフラッシュの確認
      expect(page).to have_selector(".alert-success", text: "A new restaurant has been registered")
    end
  end

  context "with invalid values" do
    let(:store) { FactoryBot.build(:store) }

    scenario "invalid store registration" do
      visit store_registration_path
      fill_in 'store_name',    with: ""
      fill_in 'store_genre',   with: store.genre
      fill_in 'store_phone',   with: store.phone
      fill_in 'store_access',  with: store.access
      fill_in 'store_hour',    with: store.hour
      fill_in 'store_website', with: store.website
      fill_in 'store_address', with: store.address
      click_on '新規登録'
      # ページタイトルの確認
      expect(page).to have_title "レストラン新規登録 | Organic Table"

      # エラーの検証
      expect(page).to have_selector("#error_explanation")
      expect(page).to have_selector(".alert-danger", text: "The form contains 1 error.")
      expect(page).to have_content("Name can't be blank")
    end
  end
end
