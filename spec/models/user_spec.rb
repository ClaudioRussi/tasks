require 'rails_helper'

RSpec.describe User, type: :model do
  context "When trying to register" do
    it "should create a new user with correct params" do
      user = build(:user)
      user.save
      expect(User.count).to eq 1
    end

    it "should not create a new user with blank first name" do
      user = build(:user, first_name:"")
      user.save
      expect(User.count).to eq 0
    end

    it "should not create a new user with blank last name" do
      user = build(:user, last_name:"")
      user.save
      expect(User.count).to eq 0
    end

    it "should not create a new user with blank email" do
      user = build(:user, email:"")
      user.save
      expect(User.count).to eq 0
    end

    it "should not create a new user with blank password" do
      user = build(:user, password:"")
      user.save
      expect(User.count).to eq 0
    end

    it "should not create a new user with blank password confirmation" do
      user = build(:user, password_confirmation:"")
      user.save
      expect(User.count).to eq 0
    end

  end
  it "should return full name" do
    user = create(:user)
    expect(user.full_name).to eq user.first_name + ' ' +user.last_name
  end
end
