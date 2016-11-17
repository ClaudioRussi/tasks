require 'rails_helper'

RSpec.feature "AddingAGroupToTheProjects", type: :feature do
  given(:project){create(:project)}
  given(:group_attr){attributes_for(:group)}

  before do
    sign_in project.author
    visit project_path(project.author)
    click_link 'Add a new group'
  end
  
  scenario "Adding a group to " do
    fill_in "Name", with: group_attr[:name]
    click_button "Create group"
    expect(page).to have_text "Group successfully created"
  end
  scenario "Adding a group with blank name" do
    click_button "Create group"
    expect(page).to have_text "Name can't be blank"
  end
end
