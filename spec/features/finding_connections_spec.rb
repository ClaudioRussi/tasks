require 'rails_helper'

RSpec.feature "FindingConnections", type: :feature do
  given(:user1){create(:user)}
  given(:user2){create(:user2)}

  before do
    sign_in user1
    visit users_path
  end

  scenario "When the other user is not a connection" do
    fill_in :search, with: user2.email
    click_button :search
    expect(page).to have_text user2.full_name+" (#{user2.email})"
    expect(page).to have_selector(:link_or_button, 'Send connection request')
  end

  scenario "When email doesn't match any user email" do
    fill_in :search, with: 'false@example.com'
    click_button :search
    expect(page).to_not have_selector(:link_or_button, 'Send connection request')
  end

  given(:relationship){create(:user_connection_relationship, user: user1, connection: user2, status: 'Accepted')}
  given(:inverse_relationship){create(:user_connection_relationship, user: user2, connection: user1, status: 'Accepted')}
  scenario "When the other user is already a connection" do
    user1.accepted_connections << user2
    fill_in :search, with: user2.email
    click_button :search
    expect(page).to_not have_text user2.full_name+" (#{user2.email})"
    expect(page).to_not have_selector(:link_or_button, 'Send connection request')
  end
end
