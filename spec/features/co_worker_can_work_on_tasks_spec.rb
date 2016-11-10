require 'rails_helper'

RSpec.feature "CoWorkerCanWorkOnTasks", type: :feature do
  given(:user2){create(:user2)}
  given(:project) {create(:project}
  given(:task) {create(:task, group:nil)}
  given(:group) {create (:group, project:nil)}
  scenario "User can work on task if is invited" do
    project.workers << user2
    project.groups << group
    project.groups.first.tasks << task
    project.save

    sing_in user2
    visit project_path(project)
    click_link group.name
    click_link task.name
    click_button "Work on this task"
    expect(:page).to have_text "Status: In Progress"
    expect(:page).to have_text "Now you are working on this task"
  end


end
