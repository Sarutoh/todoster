# frozen_string_literal: true

feature 'Delete task: ', type: :feature do
  let_it_be(:current_user) { create(:user) }
  let_it_be(:task) { create(:task, user: current_user) }

  before do
    sign_in(current_user)
    visit tasks_path
  end

  scenario 'Page have delete button' do
    expect(page).to have_link('Delete')
    expect(page).to have_link('Complete')
  end

  scenario 'Succesfully delete task' do
    expect { find_link('Delete').click }.to change { Task.count }.from(1).to(0)
    expect(page).to have_content('Task was successfully destroyed.')
    expect(current_path).to eq(tasks_path)
  end
end
