 //= require jquery
 //= require jquery_ujs
 //= require turbolinks
 //= require_tree .

 // Init page modules
$(document).ready(function() {
  application.init();
  welcome.init();
  live.init();
});

var application = {
  init: function() {
    this.bindUIElements();
  },

  settings: {
    isStreamPlaying: false
  },

  bindUIElements: function() {
    var audio = $('.audio-stream')[0];
    $('.header').on('click', '.player', function(event) {
      if (settings.streamIsPlaying) {
        audio.play();
      }
      else {
        audio.pause();
      }
      $('.audio-player').toggleClass('playing').toggleClass('not-playing');
      settings.isStreamPlaying = !settings.isStreamPlaying;
    });
  }
}
