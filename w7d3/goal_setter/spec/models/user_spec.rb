require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_length_of(:password).is_at_least(6)}

  describe "uniqueness" do
    before :each do
      create(:user)
    end

    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
  end

  describe "::find_by_credentials" do
    let!(:user) {create(:user)}
    # before :each do
    #   create(:user)
    # end

    context "with proper credentials" do
     it "should return proper user" do 
      expect(User.find_by_credentials(user.username, "starwars")).to eq(user)
     end
    end

    context "with improper credentials" do
      it "returns nil" do
        expect(User.find_by_credentials(user.username, "startrek" )).to eq(nil)
      end
    end
  end
end
