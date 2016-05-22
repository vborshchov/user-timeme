App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $(document).ready ->
      appearances_html = ('<p>' + appearance + '</p>' for appearance in data['appearances'])
      document.getElementById('appearances').innerHTML = appearances_html.join('')
