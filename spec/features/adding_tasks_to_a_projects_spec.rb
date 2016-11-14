require 'rails_helper'

RSpec.feature "AddingTasksToAProjects", type: :feature do
  given(:user){create(:user)}
  given(:project){create(:project, author_id: user.id)}
  given(:group){create(:group, project_id: project.id)}
  given(:task_attr){attributes_for(:pending_task)}

  scenario "Adding a task with correct attributes" do
    sign_in user
    visit group_path(project,group)
    click_link "Add task"
    fill_in 'Name', with: task_attr[:name]
    fill_in 'Description', with: task_attr[:description]
    click_button :create_task
    expect(page).to have_text "Task successfully created"
  end
end
