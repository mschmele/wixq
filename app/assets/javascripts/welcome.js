var welcome = {
  init: function() {
    this.bindUIElements();
    this.getNowPlaying();
  },

  bindUIElements: function() {
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
};
