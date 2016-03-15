App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    App.appearance.appear()

  disconnected: ->
    @away()

  received: (data) ->
    $(document).ready ->
      appearances_html = ('<p>' + appearance + '</p>' for appearance in data['appearances'])
      document.getElementById('appearances').innerHTML = appearances_html.join('')

  appear: ->
    @perform("appear")

  away: ->
    @perform("away")
