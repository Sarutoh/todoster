# frozen_string_literal: true

feature 'Update item: ', type: :feature do
  let_it_be(:current_user) { create(:user) }
  let_it_be(:task) { create(:task, user: current_user) }
  let_it_be(:item) { create(:item, task: task) }
  let_it_be(:success_message) { 'Item was successfully updated.' }
  let_it_be(:error_message) { "Item can't be blank" }
  let_it_be(:incorrect_value) { '' }
  let_it_be(:correct_value) { 'task_1 item-0' }

  before do
    sign_in(current_user)
    visit task_path(task)

    within('#item-0') do
      find_link('Edit').click
    end
  end

  scenario 'Page have content update item' do
    expect(page).to have_content('Editing Item')
    expect(page).to have_button('Update')
    expect(page).to have_link('Back')
    expect(current_path).to eq(edit_task_item_path(task, item))
  end

  scenario 'Successfully update item' do
    within('form') do
      fill_in 'item_item', with: correct_value

      click_button 'Update'
    end

    expect(page).to have_content(correct_value)
    expect(page).to have_content(success_message)
    expect(current_path).to eq(task_path(task))
  end

  scenario 'Do not update item' do
    within('form') do
      fill_in 'item_item', with: incorrect_value

      click_button 'Update'
    end

    expect(page).to have_content(error_message)
    expect(current_path).to eq(task_item_path(task, item))
  end
end
