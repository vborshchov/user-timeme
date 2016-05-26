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


$('document').ready(function() {
  // dismiss alert messages
  setTimeout(function() {
    $('.alert').slideUp();
  }, 3000);

  // go to last message
  if($('#general_conversation, #special_conversation').size() !== 0) {
    $('#general_conversation, #special_conversation').scrollTop($('#general_conversation, #special_conversation')[0].scrollHeight);
  }
});
