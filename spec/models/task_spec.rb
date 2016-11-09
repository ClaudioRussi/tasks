require 'rails_helper'

RSpec.describe Task, type: :model do
  context "Creating a task" do
    it "should save the task with correct params" do
      task = build(:pending_task)
      expect(task.save).to be true
    end

    it "should not save the task with blank name" do
      task = build(:pending_task, name:'')
      expect(task.save).to be false
    end

    it "should not save the task with blank description" do
      task = build(:pending_task, description:'')
      expect(task.save).to be false
    end
  end
end
