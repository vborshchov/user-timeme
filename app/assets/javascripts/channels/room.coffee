App.general_room = App.cable.subscriptions.create { channel: "RoomChannel", room: "general" },
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#messages').append data['message']
    see_last_msg('#general_conversation')

  speak: (message) ->
    @perform('speak', message: message)


App.special_room = App.cable.subscriptions.create { channel: "RoomChannel", room: "special" },
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#special_messages').append data['message']
    see_last_msg('#special_conversation')

  speak: (message) ->
    @perform('speak', message: message)


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    event.preventDefault()
    if event.target.id == "special_message"
      App.special_room.speak event.target.value
    if event.target.id == "message"
      App.general_room.speak event.target.value
    event.target.value = ''

$ ->
  $('button.send').on 'click', (event) ->
    event.preventDefault()
    if event.target.id == "send"
      App.general_room.speak $('#message').val()
      $('#message').val('')
    if event.target.id == "special_send"
      App.special_room.speak $('#special_message').val()
      $('#special_message').val('')

# when in the bottom or near the bottom, scroll to the bottom
see_last_msg = (room_id) ->
  last_message_area = $(room_id)[0].scrollTop + 70
  seen_area = $(room_id)[0].scrollHeight - ($(room_id)[0].offsetHeight)
  if last_message_area >= seen_area
    $(room_id).scrollTop($(room_id)[0].scrollHeight)
  else
    console.log 'New messages'

App.see_last_msg = see_last_msg
