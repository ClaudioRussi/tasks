require 'rails_helper'

RSpec.feature "ChangeTaskStatuses", type: :feature do

  describe "Pending tasks" do
    given(:task) {create(:pending_task)}
    before do
      @user = task.project.author
      sign_in @user
    end

    scenario "When user tries to change task to the next status" do
      visit group_path task.group
      within('div#next-status-button') do
        click_button 'In progress'
      end
      within('div.in-progress-tasks-list') do
        expect(page).to have_text task.name
      end
    end

    scenario "When user tries to change task to the previous status" do
      visit group_path task.group
      within('div#previous-status-button') do
        expect(page).to_not have_selector(:link_or_button)
      end
    end
  end

  describe "In progress tasks" do
    given(:task) {create(:in_progress_task)}
    before do
      @user = task.project.author
      sign_in @user
    end

    scenario "When user tries to change task to the next status" do
      visit group_path task.group
      within('div#next-status-button') do
        click_button 'Finished'
      end
      within('div.finished-tasks-list') do
        expect(page).to have_text(task.name)
      end
    end

    scenario "When user tries to change task to the previous status" do
      visit group_path task.group
      within('div#previous-status-button') do
        click_button 'Pending'
      end
      within('div.pending-tasks-list') do
        expect(page).to have_text(task.name)
      end
    end
  end

  describe "Finished tasks" do
    given(:task) {create(:finished_task)}
    before do
      @user = task.project.author
      sign_in @user
    end

    scenario "When user tries to change task to the previous status" do
      visit group_path task.group
      within('div#previous-status-button') do
        click_button 'In progress'
      end
      within('div.in-progress-tasks-list') do
        expect(page).to have_text task.name
      end
    end

    scenario "When user tries to change task to the next status" do
      visit group_path task.group
      within('div#next-status-button') do
        expect(page).to_not have_selector(:link_or_button)
      end
    end
  end

end
