require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'when valid' do
    it 'has a valid facory' do
      expect(FactoryBot.build(:store)).to be_valid
    end
  end

  context 'when invalid withoud a particular attribute' do
    it 'is invalid without a name' do
      store = FactoryBot.build(:store, name: nil)
      store.valid?
      expect(store.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a genre' do
      store = FactoryBot.build(:store, genre: nil)
      store.valid?
      expect(store.errors[:genre]).to include("can't be blank")
    end

    it 'is invalid without a phone' do
      store = FactoryBot.build(:store, phone: nil)
      store.valid?
      expect(store.errors[:phone]).to include("can't be blank")
    end

    it 'is invalid without an access' do
      store = FactoryBot.build(:store, access: nil)
      store.valid?
      expect(store.errors[:access]).to include("can't be blank")
    end

    it 'is invalid without an hour' do
      store = FactoryBot.build(:store, hour: nil)
      store.valid?
      expect(store.errors[:hour]).to include("can't be blank")
    end

    it 'is invalid without a website' do
      store = FactoryBot.build(:store, website: nil)
      store.valid?
      expect(store.errors[:website]).to include("can't be blank")
    end

    it 'is invalid without an address' do
      store = FactoryBot.build(:store, address: nil)
      store.valid?
      expect(store.errors[:address]).to include("can't be blank")
    end
  end

  context 'when invalid with a too long attribute ' do
    it 'is invalid with a too long name' do
      store = FactoryBot.build(:store, name: "a" * 51)
      expect(store).to be_invalid
    end

    it 'is invalid with a too long genre' do
      store = FactoryBot.build(:store, genre: "a" * 31)
      expect(store).to be_invalid
    end

    it 'is invalid with a too long phone' do
      store = FactoryBot.build(:store, phone: "a" * 21)
      expect(store).to be_invalid
    end

    it 'is invalid with a too long access' do
      store = FactoryBot.build(:store, access: "a" * 31)
      expect(store).to be_invalid
    end

    it 'is invalid with a too long hour' do
      store = FactoryBot.build(:store, hour: "a" * 51)
      expect(store).to be_invalid
    end

    it 'is invalid with a too long website' do
      store = FactoryBot.build(:store, website: "a" * 101)
      expect(store).to be_invalid
    end

    it 'is invalid with a too long address' do
      store = FactoryBot.build(:store, address: "a" * 51)
      expect(store).to be_invalid
    end
  end

  context 'when invalid with a duplicate attribute' do
    it 'is invalid with a duplicate phone' do
      FactoryBot.create(:store, phone: "123-456-789")
      store = FactoryBot.build(:store, phone: "123-456-789")
      store.valid?
      expect(store.errors[:phone]).to include("has already been taken")
    end
  end
end
