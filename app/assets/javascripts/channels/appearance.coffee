App.appearance = App.cable.subscriptions.create "AppearanceChannel",
  connected: ->
    TimeMe.resetAllRecordedPageTimes
    # TimeMe.setIdleDurationInSeconds 30
    # TimeMe.setCurrentPageName location.pathname
    # TimeMe.initialize -1

    # setInterval (->
    #   timeSpentOnPage = TimeMe.getTimeOnCurrentPageInSeconds()
    #   console.log timeSpentOnPage.toFixed(2)
    #   return
    # ), 5000

  disconnected: ->
    TimeMe.stopTimer

  received: (data) ->
    appearances_html = ('<p>' + appearance + '</p>' for appearance in data['appearances'])
    document.getElementById('appearances').innerHTML = appearances_html.join('')

  say_something: (message) ->
    @perform('say_something', message: message)


# window.onbeforeunload = (event) ->
#   console.log(location.pathname)
#   # xmlhttp = new XMLHttpRequest
#   App.appearance.say_something 'page: ' + location.pathname + ' ' + 'time: ' + TimeMe.getTimeOnCurrentPageInSeconds().toFixed(2)
#   # xmlhttp.open 'POST', 'ENTER_URL_HERE', false
#   # xmlhttp.setRequestHeader 'Content-type', 'application/x-www-form-urlencoded'
#   # timeSpentOnPage = TimeMe.getTimeOnCurrentPageInSeconds()
#   # xmlhttp.send timeSpentOnPage
#   return