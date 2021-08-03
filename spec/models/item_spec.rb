# frozen_string_literal: true

RSpec.describe Item, type: :model do
  context 'validations' do
    it { should validate_presence_of(:item) }
    it { should_not allow_values('', ' ').for(:item) }
  end

  context 'relations' do
    it { should belong_to(:task) }
  end
end
