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
 
	$("#radioButtonEvent").change(function() {
		$(".select_date").fadeIn("slow");
	});
 
	$("#radioButtonStation").change(function() {
		$(".select_date").fadeOut("slow");
	});

  /* The change of the background and textcolor in the eventlist depend on the the menuselection are moved to the viewfiles*/  

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



