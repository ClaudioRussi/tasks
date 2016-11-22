require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  given(:user){create(:user)}

  before{visit 'sign_in'}

  scenario "Loging in with correct params" do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text "Signed in successfully"
  end

  scenario "Loging in with wrong email" do
    fill_in 'Email', with: ''
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text "Invalid Email or password"
  end

  scenario "Loging in with wrong password" do
    fill_in 'Email', with: user.email
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_text "Invalid Email or password"
  end
end
