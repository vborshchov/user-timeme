require 'rails_helper'

describe RoomsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

  describe 'GET #show' do
    it "populates an array of all messages" do
      hello = create(:message, content: "Hello")
      world = create(:message, content: "World!")
      get :show
      expect(assigns(:messages)).to match_array([hello, world])
    end
  end
end
