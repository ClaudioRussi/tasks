require 'rails_helper'

RSpec.feature "AddingConnectionsToProjects", type: :feature do
  given(:user){create(:user)}
  given(:user2){create(:user2)}
  given(:project){create(:project, author_id: user.id)}
  scenario "Adding a connection to a project" do
    ConnectionRequest.create(user_id:user.id, status:'Accepted', connection_id: user2.id)
    sign_in user
    expect(user.accepted_connections.count).to eq 1
    visit project_path(project)
    select user2.email, from: :collaborator_id
    click_button "Add to project"
    expect(page).to have_text "Collaborator successfully added to this project"
  end
end
