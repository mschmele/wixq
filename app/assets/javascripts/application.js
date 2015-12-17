$(document).ready( function () {
	var audio = $('.audio-stream')[0];
	var streamIsPlaying = false;

	$('.header').on('click', '.player', function (event) {
		(streamIsPlaying) ? audio.play() : audio.pause();

		$(this).toggleClass('playing').toggleClass('not-playing');
		streamIsPlaying = !streamIsPlaying;
	});
});
