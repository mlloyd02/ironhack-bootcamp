$(function () {

	var Songs = function() {
		this.url = 'https://api.spotify.com/v1/search?type=track&query=' + $('#search').val();
		this.title = $('.title');
		this.artist = $('.artist');
		this.image = $('img');
		this.audio = $('audio');
	};

	Songs.prototype.fetchSongs = function () {
		var that = this;

			$.ajax({
			  url: this.url,
			  success: function (result) {
			    that.render(result);
			  }
			});
		
	}

	Songs.prototype.render = function (result) {
		this.title.text(result.tracks.items[0].name);
		this.artist.text(result.tracks.items[0].artists[0].name);
		var imgUrl = result.tracks.items[0].album.images[0].url;
		var previewUrl = result.tracks.items[0].preview_url;
		this.image.attr('src', imgUrl);
		this.audio.attr('src', previewUrl);
		this.enable();
	}

	Songs.prototype.enable = function () {
		$('.btn-play').toggleClass('disabled');
	}

	var PlaySong = function() {

	};

	PlaySong.prototype.play = function () {
		if ($('.btn-play').hasClass('playing')) {
			$('.js-player').trigger('pause');
		} else {
			$('.js-player').trigger('play');
		}
		$('.btn-play').toggleClass('playing');
	};

	PlaySong.prototype.updateProgress = function () {

	}

	$('form').on('submit', function(e) {
		e.preventDefault();
		var newsong = new Songs();
		newsong.fetchSongs();
	});

	$('.btn-play').on('click', function(e) {
		e.preventDefault();
		var newPlay = new PlaySong();
		newPlay.play();	
	});

	function printTime () {
	  var current = $('.js-player').prop('currentTime');
	  $('progress').attr('value', current);
	}

	$('.js-player').on('timeupdate', printTime);



});

