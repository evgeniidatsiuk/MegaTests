require 'rails_helper'

RSpec.describe PostComment, type: :model do
  let!(:user){create(:user)}
    let!(:post){create(:post, user: user)}

    subject{
       build(:post_comment, user: user, post: post)
    }

    context "validation" do
      it "is valid with valid attributes" do
        expect(subject).to be_valid
        pp subject
      end

      it "should not be valid without body" do
         subject.body = nil
         expect(subject).to_not be_valid
      end

      it { should validate_presence_of(:body) }
    end

    context "association" do
      it { should belong_to(:user) }
      it { should belong_to(:post) }
    end
end
