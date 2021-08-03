# frozen_string_literal: true

feature 'Create item: ', type: :feature do
  let_it_be(:current_user) { create(:user) }
  let_it_be(:incorrect_value) { '' }
  let_it_be(:correct_value) { 'item_1' }
  let_it_be(:success_message) { 'Item was successfully created.' }
  let_it_be(:error_message) { "Item can't be blank" }
  let!(:task) { create(:task, user: current_user) }

  before do
    sign_in(current_user)
    visit task_path(task)
    find_link('Add item').click
  end

  scenario 'Page have content new item' do
    expect(page).to have_content('New Item')
  end

  scenario 'Do not create task with blank value' do
    within('form') do
      fill_in 'item_item', with: incorrect_value

      click_button 'Add'
      task.reload
    end

    expect(page).to have_content(error_message)
    expect(task.items.count).to eq(0)
    expect(current_path).to eq(task_items_path(task))
  end

  scenario 'Successfully create task' do
    within('form') do
      fill_in 'item_item', with: correct_value

      click_button 'Add'
      task.reload
    end

    expect(page).to have_content(success_message)
    expect(task.items.count).to eq(1)
    expect(current_path).to eq(task_path(task))
  end
end
