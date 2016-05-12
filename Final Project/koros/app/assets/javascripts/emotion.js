$(document).ready(function(){
	$('.AScontainer input').on('mousemove change', function(){ 
  	var valence = $('#emotion_valence').val();
  	var arousal = $('#emotion_arousal').val();
  	$('.dial img').css("transform", "rotate(" + Math.atan2((arousal - .5),(valence - .5)) + "rad)");
	});
});