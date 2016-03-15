require 'rails_helper'

describe Message do
  it "is valid with content and user" do
    expect(build(:message)).to be_valid
  end

  it "is invalid without a user" do
    expect(build(:message, user: nil)).to be_invalid
  end

  it "is invalid without content" do
    expect(build(:message, content: nil)).to be_invalid
  end
end
