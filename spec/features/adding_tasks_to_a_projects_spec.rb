require 'rails_helper'

RSpec.feature "AddingTasksToAProjects", type: :feature do
  given(:user){create(:user)}
  given(:project){create(:project)}
  given(:group){create(:project)}
  given(:task_attr){attributes_for(:task)}

  scenario "Adding a task with correct attributes" do
    sign_in user
    visit group_path(group)
    click_button "Add task"
    fill_in 'Name', with: task_attr.name
    fill_in 'Description', with: task_attr.description
    click_button 'Create task'
    expect(page).to have_text "Task successfully created"
  end
end
