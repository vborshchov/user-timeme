class RoomsController < ApplicationController
  def show
    @messages = Message.where(room: "general")
    @special_messages = Message.where(room: "special")
    @appearances = []
  end
end
