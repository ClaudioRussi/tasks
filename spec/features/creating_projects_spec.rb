require 'rails_helper'

RSpec.feature "CreatingProjects", type: :feature do
  given(:user){create(:user)}
  given(:project_attr){attributes_for(:project)}

  before do
    sign_in user
    visit 'projects'
    click_link 'Create new project'
  end

  scenario "Creating a project with correct attributes" do
    fill_in 'Name', with: project_attr[:name]
    fill_in 'Description', with: project_attr[:description]
    click_button 'Create project'
    expect(page).to have_text 'Project created successfully'
  end

  scenario "Creating a project with blank name" do
    fill_in 'Description', with: project_attr[:description]
    click_button 'Create project'
    expect(page).to have_text "Name can't be blank"
  end

  scenario "Creating a project with blank description" do
    fill_in 'Name', with: project_attr[:name]
    click_button 'Create project'
    expect(page).to have_text "Description can't be blank"
  end


end
