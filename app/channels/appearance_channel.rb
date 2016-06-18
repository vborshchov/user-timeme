# Be sure to restart your server when you modify this file. Action Cable runs in an EventMachine loop that does not support auto reloading.
class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance_channel"
    current_user.online
  end

  def unsubscribed
    current_user.offline
  end

  def say_something(data)
    puts "USER #{current_user.username} message: #{data['message']}"
    logger.info "USER #{current_user.username} message: #{data['message']}"
  end

end
