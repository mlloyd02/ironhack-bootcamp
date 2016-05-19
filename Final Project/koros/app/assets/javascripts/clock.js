function setClockMonth(angle, intensity) {
	$('.dial-color-month img').css("transform", "rotate(" + angle + "rad)");
	$('#prog-color').attr('value', intensity);
};

function setClockWeek(angle, intensity) {
	$('.dial-color-week img').css("transform", "rotate(" + angle + "rad)");
	$('#prog-color-week').attr('value', intensity);
};