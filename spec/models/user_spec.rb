require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
    build(:user)
  }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "associations" do
    it { should have_one(:userparam).dependent(:destroy) }
  end
end
