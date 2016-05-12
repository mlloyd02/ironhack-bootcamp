$(document).ready(function(){
	$('.AScontainer input').on('mousemove change', function(){ 
  	var valence = $('#emotion_valence').val();
  	var arousal = $('#emotion_arousal').val();
  	// var intensity = Math.sqrt(Math.pow(valence - .5, 2) + Math.pow(arousal - .5, 2));
  	$('.dial img').css("transform", "rotate(" + Math.atan2((arousal - .5),(valence - .5)) + "rad)");
	});
});

