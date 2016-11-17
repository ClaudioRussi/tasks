require 'rails_helper'

RSpec.feature "AddingConnectionsToProjects", type: :feature do
  given(:user2){create(:user2)}
  given(:project){create(:project)}
  before {ConnectionRequest.create(user_id:project.author.id, status:'Accepted', connection_id: user2.id)}

  scenario "Adding a connection to a project" do
    sign_in project.author
    expect(project.author.accepted_connections.count).to eq 1
    visit project_path(project)
    select "#{user2.full_name}(#{user2.email})", from: :collaborator_id
    click_button "Add to project"
    expect(page).to have_text "Collaborator successfully added to this project"
    expect(page).not_to have_select(:collaborator_id, options: ["#{user2.full_name}(#{user2.email})"])
  end
end
