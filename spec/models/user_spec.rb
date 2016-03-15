require 'rails_helper'

describe User do
  it "is valid with a username, email and password" do
    expect(build(:user)).to be_valid
  end

  it "is invalid without a username" do
    expect(build(:user, username: nil)).to be_invalid
  end

  it "is invalid without an email address" do
    expect(build(:user, email: nil)).to be_invalid
  end

  it "is invalid without a password" do
    expect(build(:user, password: nil)).to be_invalid
  end

  it "is invalid with a duplicate email address" do
    first_user = create(:user)
    expect(build(:user, email: first_user.email)).to be_invalid
  end
end
