require 'rails_helper'

RSpec.describe Group, type: :model do
  context "Creating a group" do
    it "should save the group with correct params" do
      group = build(:group)
      expect(group.save).to be true
    end

    it "should not save the group with blank name" do
      group = build(:group, name:'')
      expect(group.save).to be false
    end

    it "should not save the group without project" do
      group = build(:group, project: nil)
      expect(group.save).to be false
    end
  end
end
