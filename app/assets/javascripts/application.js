 //= require jquery
 //= require jquery_ujs
 //= require turbolinks
 //= require_tree .

$(document).ready( function () {
	var audio = $('.audio-stream')[0];
	var streamIsPlaying = false;

	$('.header').on('click', '.player', function (event) {
		if (!streamIsPlaying) {
			audio.play();
		}
		else {
			audio.pause();
		}

		$('.audio-player').toggleClass('playing').toggleClass('not-playing');
		streamIsPlaying = !streamIsPlaying;
	});

	$('.request-form').submit(function(event) {
		event.preventDefault();
		data = {
			request: {
				title: $('#song').val(),
				artist: $('#artist').val(),
				requested_by: $('#requester').val()
			}
		};
		$.post(
			'/request',
			data,
			function(data) {
				alert("Thanks for the request, dude!");
				$('.request-form')[0].reset();
			}
		);
	});
});
