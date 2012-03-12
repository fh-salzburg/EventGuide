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
var msg = /erfolgreich/;

$(document).ready(function(){

  //if Browser is not from a Smartphone then add some CSS
  if(!navigator.userAgent.match(/iPhone/) && !navigator.userAgent.match(/Android/) && !navigator.userAgent.match(/Blackberry/))
  {
	  $("body").css("overflow","hidden");
	  $("#left_column").css("overflow-y","auto");
	  $("#right_column").css("overflow-y","auto");
	  $("#left_column").css("overflow-x","hidden");
	  $("#right_column").css("overflow-x","hidden");
	  $("#left_column").css("bottom","0");
	  $("#right_column").css("bottom","0");
  }
  //if we have a long list on the left column, the background of right one ends to early, because the height is limited to the content or right_column. Against this we strech the righ column to the height of the left column.
  else
  {
	var leftColHight = $('#left_column').height();
	$("#right_column").css("height",leftColHight);
  }
  
  var showLogin = true;
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

  //animation for Login- and Logoutmessage
  if(!$('fancybox-outer').is(':visible') && showLogin == true)
  {
    $(".flashMessage").fadeIn(500);
    $(".flashMessage").delay(1000);
    $(".flashMessage").fadeOut(500);
  }

  $('.fancybox').click(function(){
    showLogin == false;
  });
});



