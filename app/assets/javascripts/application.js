// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

TimeMe.setIdleDurationInSeconds(30);

TimeMe.setCurrentPageName(location.pathname);

TimeMe.initialize(-1);

setInterval((function() {
  var timeSpentOnPage;
  timeSpentOnPage = TimeMe.getTimeOnCurrentPageInSeconds();
  console.log(timeSpentOnPage.toFixed(2));
}), 5000);

$('document').ready(function() {
  // dismiss alert messages
  setTimeout(function() {
    $('.alert').slideUp();
  }, 3000);

  // go to last message
  if($('#general_conversation, #special_conversation').size() !== 0) {
    $('#general_conversation, #special_conversation').scrollTop($('#general_conversation, #special_conversation')[0].scrollHeight);
  }

  // возвращает cookie с именем name, если есть, если нет, то undefined
  var getCookie = function(name) {
    var matches = document.cookie.match(new RegExp(
      "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
    ));
    return matches ? decodeURIComponent(matches[1]) : undefined;
  }

  window.onbeforeunload = function(event) {
    var timeSpentOnPage, xmlhttp;
    console.log(location.pathname);
    xmlhttp = new XMLHttpRequest;
    timeSpentOnPage = TimeMe.getTimeOnCurrentPageInSeconds();
    $.post("/statistics/create", { json_string:JSON.stringify({user: getCookie('user_id'), page: location.pathname, time: timeSpentOnPage}) });
    // xmlhttp.open('POST', '/statistics', false);
    // xmlhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    // xmlhttp.send(timeSpentOnPage);
  };
});
