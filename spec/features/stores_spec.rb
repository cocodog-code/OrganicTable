require 'rails_helper'

RSpec.feature "Stores feature", type: :feature do
  context "with valud values" do
    let(:store) { FactoryBot.build(:store) }

    scenario "valid store registration" do
      # ストア登録
      visit store_registration_path
      fill_in 'store_name',    with: store.name
      fill_in 'store_genre',   with: store.genre
      fill_in 'store_phone',   with: store.phone
      fill_in 'store_access',  with: store.access
      fill_in 'store_hour',    with: store.hour
      fill_in 'store_website', with: store.website
      fill_in 'store_address', with: store.address
      fill_in 'store_description', with: store.description
      attach_file("store[image]", "spec/fixtures/files/test_image.jpg")
      click_on '新規登録'
      # ページタイトルの確認
      expect(page).to have_title "#{store.name} | Organic Table"
      # フラッシュの確認
      expect(page).to have_selector(".alert-success", text: "A new restaurant has been registered")
      # ストア情報更新
      store = Store.first
      click_on 'ストア編集'
      fill_in 'store_name',    with: "new_name"
      fill_in 'store_genre',   with: "new_genre"
      fill_in 'store_phone',   with: "new_phone"
      fill_in 'store_access',  with: "new_access"
      fill_in 'store_hour',    with: "new_hour"
      fill_in 'store_website', with: "new_website"
      fill_in 'store_address', with: "new_address"
      fill_in 'store_description', with: "new_description"
      attach_file("store[image]", "spec/fixtures/files/new_image.jpg")
      click_on '変更を保存'
      # 変更が成功しているか確認
      store.reload
      expect(store.name).to eq "new_name"
      expect(store.genre).to eq "new_genre"
      expect(store.phone).to eq "new_phone"
      expect(store.access).to eq "new_access"
      expect(store.hour).to eq "new_hour"
      expect(store.website).to eq "new_website"
      expect(store.address).to eq "new_address"
      expect(store.description).to eq "new_description"
      # 画像が変更されているか確認
      expect(page).to have_selector "img[src$='new_image.jpg']"
      # ページタイトルの確認
      expect(page).to have_title "new_name | Organic Table"
      # フラッシュの確認
      expect(page).to have_selector ".alert-success", text: "レストランの情報を更新しました。"
    end
  end

  context "with invalid values" do
    context "#create" do
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
        fill_in 'store_description', with: store.description
        attach_file("store[image]", "spec/fixtures/files/test_image.jpg")
        click_on '新規登録'
        # ページタイトルの確認
        expect(page).to have_title "レストラン新規登録 | Organic Table"

        # エラーの検証
        expect(page).to have_selector("#error_explanation")
        expect(page).to have_selector(".alert-danger", text: "1つエラーがあります。")
        expect(page).to have_content("名前を入力してください")
      end
    end

    context "#update" do
      let(:store) { FactoryBot.create(:store) }

      scenario "invalid store edit" do
        visit edit_store_path(store)
        fill_in 'store_name',    with: ""
        fill_in 'store_genre',   with: store.genre
        fill_in 'store_phone',   with: store.phone
        fill_in 'store_access',  with: store.access
        fill_in 'store_hour',    with: store.hour
        fill_in 'store_website', with: store.website
        fill_in 'store_address', with: store.address
        fill_in 'store_description', with: store.description
        attach_file("store[image]", "spec/fixtures/files/new_image.jpg")
        click_on '変更を保存'
        # ページタイトルの確認
        expect(page).to have_title "レストラン情報更新 | Organic Table"

        # エラーの検証
        expect(page).to have_selector("#error_explanation")
        expect(page).to have_selector(".alert-danger", text: "1つエラーがあります。")
        expect(page).to have_content("名前を入力してください")
      end
    end
  end
end
