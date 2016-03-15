class RoomsController < ApplicationController
  def show
    @messages = Message.all
    @appearances = []
  end
end
