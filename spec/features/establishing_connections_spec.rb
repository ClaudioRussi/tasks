require 'rails_helper'

RSpec.feature "EstablishingAconnection", type: :feature do
  given(user1) {create(:user,attributes_for(:user).except(:connection))}
  given(user2) {create(:user2)}
  scenario "User send connection request" do
    sign_in(user1)
    visit user_path(user2)
    click_button 'Send connection request'
    expect(page).to have_text "Connection request sent"
    expect(page).to_not have_button "Send connection request"
  end
  scenario "User can accept connections" do
    create(:connection_request)
    sign_in(user2)
    visit '/'
    click_link 'You have 1 connection request'
    click_button "Accept friend request"
    expect(page).to have_text "Connection request accepted"
    expect(user2.connections.count) eq 1
  end
end
