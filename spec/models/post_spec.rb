require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user){create(:user)}

subject{
   build(:post, user: user)
}

context "validation" do
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "should not be valid without title" do
     subject.title = nil
     expect(subject).to_not be_valid
  end

  it { should validate_presence_of(:title) }

  it "should not be valid without body" do
     subject.body = nil
     expect(subject).to_not be_valid
  end

  it { should validate_presence_of(:body) }
end

context "association" do
  it { should belong_to(:user) }
end

end
