require 'rails_helper'

RSpec.feature "AddingConnectionsToProjects", type: :feature do
  given(:user){create(:user)}
  given(:user2){create(:user2)}
  given(:project){create(:project)}
  scenario "Adding a connection to a project" do
    sign_in user
    visit project_path(project)
    select user2.email, from: "Co workers"
    click_button "Add to project"
    expect(page).to have_text "Co-worker added successfully"
  end
end
