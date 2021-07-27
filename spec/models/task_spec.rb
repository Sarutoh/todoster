# frozen_string_literal: true

RSpec.describe Task, type: :model do
  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(Task::MIN_TITLE_LENGTH).is_at_most(Task::MAX_TITLE_LENGTH) }
    it { should_not allow_values('', ' ').for(:title) }
  end

  context 'relations' do
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end
end
