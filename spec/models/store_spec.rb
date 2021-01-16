require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'when valid' do
    let(:store) { build(:store) }

    it 'has a valid facory' do
      expect(store).to be_valid
    end
  end

  context 'when invalid withoud a particular attribute' do
    let(:store) { build(:store) }

    it 'is invalid without a name' do
      store.name = nil
      store.valid?
      expect(store.errors[:name]).to include("を入力してください")
    end

    it 'is invalid without a genre' do
      store.genre = nil
      store.valid?
      expect(store.errors[:genre]).to include("を入力してください")
    end

    it 'is invalid without a phone' do
      store.phone = nil
      store.valid?
      expect(store.errors[:phone]).to include("を入力してください")
    end

    it 'is invalid without an access' do
      store.access = nil
      store.valid?
      expect(store.errors[:access]).to include("を入力してください")
    end

    it 'is invalid without an hour' do
      store.hour = nil
      store.valid?
      expect(store.errors[:hour]).to include("を入力してください")
    end

    it 'is invalid without a website' do
      store.website = nil
      store.valid?
      expect(store.errors[:website]).to include("を入力してください")
    end

    it 'is invalid without an address' do
      store.address = nil
      store.valid?
      expect(store.errors[:address]).to include("を入力してください")
    end

    it 'is invalid without an image' do
      store.image = nil
      store.valid?
      expect(store.errors[:image]).to include("can't be blank")
    end
  end

  context 'when invalid with a too long attribute ' do
    let(:store) { build(:store) }

    it 'is invalid with a too long name' do
      store.name = "a" * 51
      expect(store).to be_invalid
    end

    it 'is invalid with a too long genre' do
      store.genre = "a" * 31
      expect(store).to be_invalid
    end

    it 'is invalid with a too long phone' do
      store.phone = "a" * 21
      expect(store).to be_invalid
    end

    it 'is invalid with a too long access' do
      store.access = "a" * 31
      expect(store).to be_invalid
    end

    it 'is invalid with a too long hour' do
      store.hour = "a" * 51
      expect(store).to be_invalid
    end

    it 'is invalid with a too long website' do
      store.website = "a" * 101
      expect(store).to be_invalid
    end

    it 'is invalid with a too long address' do
      store.address = "a" * 51
      expect(store).to be_invalid
    end
  end

  context 'when invalid with a duplicate attribute' do
    let!(:store1) { create(:store, phone: "123-456") }
    let(:store2) { build(:store, phone: "123-456") }

    it 'is invalid with a duplicate phone' do
      store2.valid?
      expect(store2.errors[:phone]).to include("はすでに存在します")
    end
  end
end
