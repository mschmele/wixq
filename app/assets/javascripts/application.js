 //= require jquery
 //= require jquery_ujs
 //= require turbolinks
 //= require jquery.turbolinks
 //= require_tree .

 // Init page modules
$(document).ready(function() {
  application.init();
  live.init();
  welcome.init();
});

var application = {
  init: function() {
    this.bindUIElements(this.settings);
    this.getNowPlaying();
  },

  settings: {
    isStreamPlaying: false
  },

  bindUIElements: function(settings) {
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
  },

  getNowPlaying: function() {
    $.get(
      "/now-playing",
      function(data) {
        $(".now-playing-song").text(data.song.title);
        $(".now-playing-artist").text(data.song.artist);

        // Poll the "now-playing" endpoint every 30 seconds
        // This is a terrible solution but hey here we are
        setTimeout(this.getNowPlaying, 30000);
      }.bind(this)
    );
  }
}
