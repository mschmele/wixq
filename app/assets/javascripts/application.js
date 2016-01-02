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

  getNowPlaying();
});

function getNowPlaying() {
  $.get(
    "/now-playing",
    function(data) {
      $(".now-playing-song").text(data.song.title);
      $(".now-playing-artist").text(data.song.artist);

      // Poll the "now-playing" endpoint every 30 seconds
      // This is a terrible solution but hey here we are
      setTimeout(getNowPlaying, 30000);
    }
  );
}
