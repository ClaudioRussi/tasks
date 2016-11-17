require 'rails_helper'

RSpec.feature "AddingTasksToAProjects", type: :feature do

  given(:group){create(:group)}
  given(:task_attr){attributes_for(:pending_task)}

  scenario "Adding a task with correct attributes" do
    sign_in group.project.author
    visit group_path(group.project,group)
    click_link "Add task"
    fill_in 'Name', with: task_attr[:name]
    fill_in 'Description', with: task_attr[:description]
    click_button :create_task
    expect(page).to have_text "Task successfully created"
  end
end
