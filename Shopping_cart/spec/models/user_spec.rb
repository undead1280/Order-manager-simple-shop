require "rails_helper"

RSpec.describe User, type: :model do
  context "validation tests" do
    it "ensures email presence" do
      user = User.new(password: "123123", password_confirmation: "123123").save
      expect(user).to eq(false)
    end

    it "should save successfuly" do
      user = User.new(email: "123@gmail.com", password: "123123", password_confirmation: "123123").save
      expect(user).to eq(true)
    end
  end
end
