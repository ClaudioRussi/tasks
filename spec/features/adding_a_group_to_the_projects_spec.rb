require 'rails_helper'

RSpec.feature "AddingAGroupToTheProjects", type: :feature do
  given(:user){create(:user)}
  given(:project){create(:project, author_id: user.id)}
  given(:group_attr){attributes_for(:group)}
  scenario "Adding a group to " do
    sign_in user
    visit project_path(project)
    click_link "Add a new group"
    fill_in "Name", with: group_attr[:name]
    click_button "Create group"
    expect(page).to have_text "Group successfully created"
  end
  scenario "Adding a group with blank name" do
    sign_in user
    visit project_path(project)
    click_link "Add a new group"
    click_button "Create group"
    expect(page).to have_text "Name can't be blank"
  end
end
