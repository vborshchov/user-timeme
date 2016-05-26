App.general_room = App.cable.subscriptions.create { channel: "RoomChannel", room: "general" },
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#messages').append data['message']
    see_last_msg()

  speak: (message) ->
    @perform('speak', message: message)


App.special_room = App.cable.subscriptions.create { channel: "RoomChannel", room: "special" },
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#specialMessages').append data['message']
    see_last_msg()

  speak: (message) ->
    @perform('speak', message: message)


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    event.preventDefault()
    App.general_room.speak event.target.value
    event.target.value = ''

$ ->
  $('#send').on 'click', (event) ->
    event.preventDefault()
    App.general_room.speak $('#message').val()
    $('#message').val('')

# when in the bottom or near the bottom, scroll to the bottom
see_last_msg = ->
  last_message_area = $('#conversation')[0].scrollTop + 70
  seen_area = $('#conversation')[0].scrollHeight - ($('#conversation')[0].offsetHeight)
  if last_message_area >= seen_area
    $('#conversation').scrollTop($('#conversation')[0].scrollHeight)
  else
    console.log 'New messages'

App.see_last_msg = see_last_msg
