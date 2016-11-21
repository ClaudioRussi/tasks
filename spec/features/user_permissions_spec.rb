require 'rails_helper'

RSpec.feature "User permissions", type: :feature do
  given(:user2) {create(:user2)}
  given(:task) {create(:pending_task)}
  given(:user1) {task.group.project.author}

  describe 'Guest' do
    scenario "Guest visiting home path" do
      visit '/'
      expect(page).to have_current_path('/users/sign_in')
    end

    scenario "Guest visiting antoher user's profile" do
      visit user_path(user2)
      expect(page).to have_current_path('/users/sign_in')
    end

    scenario "Guest visitng a project path" do
      visit project_path(task.group.project)
      expect(page).to have_current_path('/users/sign_in')
    end

  end
  describe 'loged-in user' do
    before{sign_in user1}

    scenario "User visiting home path" do
      visit '/'
      expect(page).to have_current_path(root_path)
    end

    scenario "User visitng antoher user's profile" do
      visit user_path(user2)
      expect(page).to have_current_path(user_path(user2))
    end

    scenario "User visiting project path" do
      visit project_path(task.group.project)
      expect(page).to have_current_path(project_path(task.group.project))
    end
  end

  describe 'When user is not a collaborator or author' do
    before{sign_in user2}

    scenario "Will be redirected to the home page if he visits a project's page" do
      visit project_path(task.group.project)
      expect(page).to have_text 'You are not a collaborator'
    end

    scenario "Will be redirected to home page if he visits a group's page" do
      visit group_path(task.group)
      expect(page).to have_text 'You are not a collaborator'
    end

    scenario "Will be redirected to home page if he visits a task's page" do
      visit task_path(task)
      expect(page).to have_text 'You are not a collaborator'
    end
  end

  describe "When user is a collaborator or project author" do
    before {sign_in user1}
    scenario "Will be able to visit the project's page" do
      visit project_path(task.group.project)
      expect(page).to have_text task.group.project.name
    end

    scenario "Will be able to visit a group's page" do
      visit group_path(task.group)
      expect(page).to have_text task.group.name
    end

    scenario "Will be able to visit a task's page" do
      visit task_path(task)
      expect(page).to have_text task.name
    end

  end
end
