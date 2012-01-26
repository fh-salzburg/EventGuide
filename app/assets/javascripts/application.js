// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require fancybox
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
	$("#radioButtonEvent").change(function() {
		$(".select_date").fadeIn("slow");
	});

	$("#radioButtonStation").change(function() {
		$(".select_date").fadeOut("slow");
	});

  /*change backgroundcolor for the actuall clicked event*/
  $(".eventlist").click(function() {
    $(".eventlist").css("background-image","-moz-linear-gradient(top, #1a1a1a, #0d0d0d)");
    $(".eventlist").css("background-image","-webkit-gradient(linear, left top, left bottom, color-stop(0.00, #1a1a1a), color-stop(1.0,#0d0d0d))");
    $(this).css("background-image","-moz-linear-gradient(top, #4d4d4d, #404040)");
    $(this).css("background-image","-webkit-gradient(linear, left top, left bottom, color-stop(0.00, #4d4d4d), color-stop(1.0,#404040))");
  });
  $("a.fancybox").fancybox();
});



