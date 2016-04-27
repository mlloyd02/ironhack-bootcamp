$(function () {
	$('form').on('submit', function(e) {
		e.preventDefault();
		
		var url = 'https://api.spotify.com/v1/search?type=artist&query=' + $('#search').val();

		$.ajax({
		  url: url,
		  success: function (result) {
		    $('container').empty();
		    for(i = 0; i < 5; i++) {
			    var imgUrl = result.artists.items[i].images[0].url;
			    var imgTag = $('<img>').attr('src', imgUrl);
			    imgTag.attr('id', result.artists.items[i].id);
			   	$('.container').append('<p>' + result.artists.items[i].name + '</p>');
			   	$('.container').append(imgTag);
			  }
		  }
		});
	});
});

// $.ajax({
//     url: url,
//     success: function (result) {
//       $('.js-artList').empty();
//       for(i = 0; i < 5; i++) {
//       var imgUrl = result.artists.items[i].images[0].url;
//       var imgTag = $('<img>').attr('src', imgUrl);
//       imgTag.attr('result.artists.items[i].id');
//      	$('.js-artList').append('<p>' + result.artists.items[i].name + '</p>');
//      	$('.js-artList').append(imgTag);
//     }
//   }