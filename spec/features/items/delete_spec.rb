# frozen_string_literal: true

feature 'Delete item: ', type: :feature do
  let_it_be(:current_user) { create(:user) }
  let_it_be(:task) { create(:task, user: current_user) }
  let_it_be(:item) { create(:item, task: task) }

  before do
    sign_in(current_user)
    visit task_path(task)
  end

  scenario 'Page have delete button' do
    expect(page).to have_link('Delete')
  end

  scenario 'Succesfully delete task' do
    expect { find_link('Delete').click }.to change { task.items.count }.from(1).to(0)
    expect(page).to have_content('Item was successfully destroyed.')
    expect(current_path).to eq(task_path(task))
  end
end
