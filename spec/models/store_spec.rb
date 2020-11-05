require 'rails_helper'

RSpec.describe Store, type: :model do
  subject { store }

  context 'valid with all attributes' do
    let(:store) { create(:store) }

    it { is_expected.to be_valid }
  end
end
