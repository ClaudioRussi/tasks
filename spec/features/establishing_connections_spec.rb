require 'rails_helper'

RSpec.feature "EstablishingAconnection", type: :feature do
  given(:user1) {create(:user,attributes_for(:user))}
  given(:user2) {create(:user2)}
  
  scenario "User send connection request" do
    sign_in(user1)
    visit user_path(user2)
    click_button 'Send connection request'
    expect(page).to have_text "Connection request sent"
    expect(page).to_not have_button "Send connection request"
  end
  scenario "User can accept connections" do
    create(:connection_request, connection_id: user2.id)
    sign_in(user2)
    visit '/'
    click_link 'You have new connection requests'
    click_button "Accept friend request"
    expect(page).to have_text "Connection request accepted"
    expect(user2.accepted_connections.count).to eq 1
  end
end
