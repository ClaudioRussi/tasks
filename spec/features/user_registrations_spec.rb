require 'rails_helper'

RSpec.feature "UserRegistrations", type: :feature do
  before{visit 'sign_up'}

  scenario "trying to register with correct params" do
    fill_in 'First name', with: 'Pedro'
    fill_in 'Last name', with: 'Fernandez'
    fill_in 'Email', with: 'pedro@example.com'
    fill_in 'Password', with: 'topsecret'
    fill_in 'Password confirmation', with: 'topsecret'
    click_button 'Sign up'
    expect(page).to have_text "Welcome! You have signed up successfully."
  end

  scenario "trying to register with blank name" do
    fill_in 'Last name', with: 'Fernandez'
    fill_in 'Email', with: 'pedro@example.com'
    fill_in 'Password', with: 'topsecret'
    fill_in 'Password confirmation', with: 'topsecret'
    click_button 'Sign up'
    expect(page).to have_text "First name can't be blank"
  end

  scenario "trying to register with blank last name" do
    fill_in 'First name', with: 'Pedro'
    fill_in 'Email', with: 'pedro@example.com'
    fill_in 'Password', with: 'topsecret'
    fill_in 'Password confirmation', with: 'topsecret'
    click_button 'Sign up'
    expect(page).to have_text "Last name can't be blank"
  end

  scenario "trying to register with blank email" do
    fill_in 'First name', with: 'Pedro'
    fill_in 'Last name', with: 'Fernandez'
    fill_in 'Password', with: 'topsecret'
    fill_in 'Password confirmation', with: 'topsecret'
    click_button 'Sign up'
    expect(page).to have_text "Email can't be blank"
  end

  scenario "trying to register with blank password" do
    fill_in 'First name', with: 'Pedro'
    fill_in 'Email', with: 'pedro@example.com'
    fill_in 'Password confirmation', with: 'topsecret'
    click_button 'Sign up'
    expect(page).to have_text "Password can't be blank"
  end

  scenario "trying to register with blank password confirmation" do
    fill_in 'First name', with: 'Pedro'
    fill_in 'Last name', with: 'Fernandez'
    fill_in 'Email', with: 'pedro@example.com'
    fill_in 'Password', with: 'topsecret'
    click_button 'Sign up'
    expect(page).to have_text "Password confirmation doesn't match Password"
  end
end
