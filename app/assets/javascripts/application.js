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
 

  /* funktioniert noch nicht */
  $('#event_menu_events').bind('ajax:success', function(data){
    $("#left_column").html('<% @events.each do |event| %><div class="eventlist"><%= link_to event.name, event %><br/><%= event.short_description %></div><% end %>');
  });

  /* change the background and textcolor in the eventlist depend on the the menuselection */  
	$("#event_menu_events").click(function(){
			$("#event_menu").css("background-position","center 100%");
			$(".eventlist").css("background-image","-moz-linear-gradient(top, #1a1a1a, #0d0d0d)");
			$(".eventlist").css("background-image","-webkit-gradient(linear, left top, left bottom, color-stop(0.00, #1a1a1a), color-stop(1.0,#0d0d0d))");
			$(".eventlist").css("border-top","1px solid #393939");
			$(".eventlist").css("border-bottom","1px solid #060606");
			$(".eventlist").css("color","#78797a");
	});

	$("#event_menu_timed").click(function(){
			$("#event_menu").css("background-position","center 0%");
      $(".eventlist").css("background","#999999");
			$(".eventlist").css("background-image","-moz-linear-gradient(top, #0e91d5, #0d84c1)");
			$(".eventlist").css("background-image","-webkit-gradient(linear, left top, left bottom, color-stop(0.00, #0e91d5), color-stop(1.0,#0d84c1))");
      $(".eventlist").css("border-top","1px solid #68bce8");
			$(".eventlist").css("border-bottom","1px solid #095e87");
			$(".eventlist").css("color","#303031");
	});

	/* This is basic - uses default settings */
	
	$("a#loginbutton").fancybox();
	$("a#newUserbutton").fancybox();
	$("a#newEventbutton").fancybox();
	
	/* Using custom settings */
	
	$("a#inline").fancybox({
		'hideOnContentClick': true
	});

	/* Apply fancybox to multiple items */
	
	$("a.group").fancybox({
		'transitionIn'	:	'elastic',
		'transitionOut'	:	'elastic',
		'speedIn'		:	600, 
		'speedOut'		:	200, 
		'overlayShow'	:	false
	});
});



