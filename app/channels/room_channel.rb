# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params[:room]}"
  end

  def unsubscribed
  end

  def speak(data)
    current_user.messages.create!(content: data['message'], room: params[:room])
  end
end
