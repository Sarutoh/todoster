# frozen_string_literal: true

feature 'Complete task: ', type: :feature do
  let_it_be(:current_user) { create(:user) }
  let(:task) { create(:task, user: current_user) }
  let!(:item1) { create(:item, task: task) }
  let!(:item2) { create(:item, task: task) }

  before do
    sign_in(current_user)
    visit tasks_path
  end

  context 'complete task from tasks page' do
    before { RSpec::Matchers.define_negated_matcher :and_not, :and }

    subject do
      find_link('Complete').click
      task.reload
      item1.reload
      item2.reload
    end

    scenario 'Push complete button' do
      expect { subject }
        .to change { task.completed }
        .from(false).to(true)
        .and change { item1.completed }
        .from(false).to(true)
        .and change { item2.completed }
        .from(false).to(true)

      expect(page).to have_content('Re-do')
      expect(current_path).to eq(root_path)
    end

    scenario 'Push complete button and Re-do button' do
      subject
      find_link('Re-do').click

      expect(task.reload.completed).to eq(false)
      expect(item1.reload.completed).to eq(false)
      expect(item2.reload.completed).to eq(false)
      expect(page).to have_content('Complete')
      expect(current_path).to eq(root_path)
    end
  end

  context 'complete task by completing its items' do
    scenario 'Complete all items of task' do
      visit "/tasks/#{task.id}"

      within('#item-0') do
        find_link('Complete').click
      end

      expect(page).to have_content('Re-do')
      expect(current_path).to eq("/tasks/#{task.id}")
    end
  end
end
