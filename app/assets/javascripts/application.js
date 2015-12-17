 //= require jquery
 //= require jquery_ujs
 //= require turbolinks
 //= require_tree .

$(document).ready( function () {
	var audio = $('.audio-stream')[0];
	var streamIsPlaying = false;

	$('.header').on('click', '.player', function (event) {
		(!streamIsPlaying) ? audio.play() : audio.pause();

		$('.audio-player').toggleClass('playing').toggleClass('not-playing');
		streamIsPlaying = !streamIsPlaying;
	});
});
