# frozen_string_literal: true

feature 'Update task: ', type: :feature do
  context 'With autorization' do
    let(:current_user) { create(:user) }
    let!(:task) { create(:task, user: current_user) }
    let(:success_message) { 'Task was successfully updated.' }
    let(:error_message) { "Title is too short (minimum is #{Task::MIN_TITLE_LENGTH} characters)" }
    let(:incorrect_value) { 'task1' }
    let(:correct_value) { 'task_1' }

    before { sign_in(current_user) }

    context 'update from root_path' do
      before do
        visit root_path

        find_link('Edit').click
      end

      scenario 'Page have content update task' do
        expect(page).to have_content('Editing Task')
        expect(page).to have_content('Show items')
        expect(page).to have_content('Back')
        expect(current_path).to eq("/tasks/#{task.id}/edit")
      end

      scenario 'Successfully update task' do
        within('form') do
          fill_in 'task_title', with: correct_value

          click_button 'Update'
        end

        expect(page).to have_content(correct_value)
        expect(page).to have_content(success_message)
        expect(current_path).to eq(root_path)
      end

      scenario 'Do not update task' do
        within('form') do
          fill_in 'task_title', with: incorrect_value

          click_button 'Update'
        end

        expect(page).to have_content(error_message)
        expect(current_path).to eq("/tasks/#{task.id}")
      end
    end

    context 'update from individual task view' do
      before do
        visit "tasks/#{task.id}"

        find_link('Edit').click
      end

      scenario 'Page have content update task' do
        expect(page).to have_content('Editing Task')
        expect(page).to have_content('Show items')
        expect(page).to have_content('Back')
        expect(current_path).to eq("/tasks/#{task.id}/edit")
      end
    end
  end
end
