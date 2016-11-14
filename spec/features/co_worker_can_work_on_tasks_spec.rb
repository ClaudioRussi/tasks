require 'rails_helper'

RSpec.feature "CoWorkerCanWorkOnTasks", type: :feature do
  given(:user2){create(:user2)}
  given(:task) {create(:pending_task)}
  scenario "User can work on task if is invited" do
    task.group.project.collaborators << user2
    task.save
    sign_in user2
    visit project_path(task.group.project)
    click_link task.group.name
    click_link task.name
    click_button "Work on this task"
    expect(page).to have_text "You are now working on this task"
  end


end
