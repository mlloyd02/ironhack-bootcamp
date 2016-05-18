$(document).ready(function(){

	function setUserClockWeek(angle, intensity) {
  	$('.dial img').css("transform", "rotate(" + angle + "rad)");
  	$('progress').attr('value', intensity);
	};

	function setUserClockMonth(angle, intensity) {
  	$('.dial-color-month img').css("transform", "rotate(" + angle + "rad)");
  	$('.prog-color .month').attr('value', intensity);
	};

	function setGroupClockWeek(angle, intensity) {
  	$('.dial img').css("transform", "rotate(" + angle + "rad)");
  	$('progress').attr('value', intensity);
  };

  function setGroupClockMonth(angle, intensity) {
  	$('.dial img').css("transform", "rotate(" + angle + "rad)");
  	$('progress').attr('value', intensity);
  };

});