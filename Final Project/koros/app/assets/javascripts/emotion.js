$(document).ready(function(){
	$('.arousal input').on('mousemove change', function(){ 
  	var val = $(this).val();
  	$('.dial img').css("transform", "rotate(" + val * 360 + "deg)");
	});
});