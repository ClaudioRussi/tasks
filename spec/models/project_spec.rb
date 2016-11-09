require 'rails_helper'

RSpec.describe Project, type: :model do
  context "Creating a project" do
    it "should create a project with an author and correct params" do
      project = build(:project)
      project.save
      expect(Project.count).to eq 1
    end


    it "should not create a project with blank name" do
      project = build(:project, name:'')
      expect(project.save).to be false
    end

    it "should not create a project with blank description" do
      project = build(:project, description:'')
      expect(project.save).to be false
    end

    it "should not create a project without author" do
      project = build(:project, author: nil)
      expect(project.save).to be false
    end

  end
end
