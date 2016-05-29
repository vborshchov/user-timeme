class RoomsController < ApplicationController
  def show
    @messages = Message.where(room: "general").includes(:user)
    @special_messages = Message.where(room: "special").includes(:user)
    @appearances = []
  end
end
