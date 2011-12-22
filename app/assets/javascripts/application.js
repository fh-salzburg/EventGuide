// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
   $("#loginbutton").toggle(function(){
     $("#login").fadeIn('slow');
   },function(){
     $("#login").fadeOut('slow');
   });

	$("#event_menu_events").click(function(){
			$("#event_menu").css("background-position","center 100%");
	});

	$("#event_menu_timed").click(function(){
			$("#event_menu").css("background-position","center 0%");
	});
});



