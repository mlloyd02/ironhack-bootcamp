$(document).ready(function(){
	$('.AScontainer input').on('mousemove change', function(){ 
  	var valence = $('#emotion_valence').val();
  	var arousal = $('#emotion_arousal').val();
  	var intensity = Math.sqrt(Math.pow(valence, 2) + Math.pow(arousal, 2));
  	$('.dial img').css("transform", "rotate(" + Math.atan2((arousal),(valence)) + "rad)");
  	$('progress').attr('value', intensity);
	});
});

