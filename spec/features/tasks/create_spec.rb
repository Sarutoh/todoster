# frozen_string_literal: true

feature 'Create task: ', type: :feature do
  context 'With autorization' do
    let(:current_user) { create(:user) }
    let(:incorrect_value) { 'task1' }
    let(:correct_value) { 'task_1' }
    let(:success_message) { 'Task was successfully created.' }

    before do
      sign_in(current_user)
      visit new_task_path
    end

    scenario 'Page have content new task' do
      expect(page).to have_content('New Task')
    end

    scenario 'Do not create task with short value' do
      within('form') do
        fill_in 'task_title', with: incorrect_value

        click_button 'Add'
      end

      expect(page).to have_content("Title is too short (minimum is #{Task::MIN_TITLE_LENGTH} characters)")
      expect(Task.count).to eq(0)
      expect(current_path).to eq(tasks_path)
    end

    scenario 'Do not create task with blank value' do
      within('form') do
        fill_in 'task_title', with: ''

        click_button 'Add'
      end

      expect(page).to have_content("Title can't be blank")
      expect(Task.count).to eq(0)
      expect(current_path).to eq(tasks_path)
    end

    scenario 'Create task' do
      within('form') do
        fill_in 'task_title', with: correct_value

        click_button 'Add'
      end

      expect(page).to have_content(correct_value)
      expect(page).to have_content(success_message)
      expect(Task.count).to eq(1)
      expect(current_path).to eq(root_path)
    end

    scenario 'Click back link' do
      click_link 'Back'

      expect(current_path).to eq(tasks_path)
    end
  end
end
