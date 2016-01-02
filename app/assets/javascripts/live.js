$(document).ready(function() {

  // Handle song logging form submit
  $(".log-song-form").submit(function(event) {
    event.preventDefault();
    if ($("#show_id").val() == "-1") {
      alert("No Show Selected!");
      return;
    }

    // Construct song object to post
    data = {
      song: {
        title: $("#title").val(),
        artist: $("#artist").val(),
        requested_by: $("#requested_by").val(),
        show_id: $("#show_id").val()
      }
    };
    $.post(
      "/song",
      data,
      function(data) {
        $(".log-song-message").text("Song logged: " + data.song.title + " by " + data.song.artist);
        $(".log-song-form")[0].reset();
      });
    });

    // Handle request acknowledge
    $(".btn-acknowledge").on("click", function(event) {
      var requestId = $(this).data("request-id");

      // Construct object used for autofilling song log form with request data
      var request = {
        title: $(".request-" + requestId + "-title").text().trim(),
        artist: $(".request-" + requestId + "-artist").text().trim(),
        requested_by: $(".request-" + requestId + "-requested-by").text().trim()
      };

      if (confirm("Autofill song log form for this request?")) {
        autofillLogSongForm(request);
      }

      $.post(
        "/request/acknowledge?id=" + requestId,
        function(data) {

          // Bind callback's "this" to the button selector that fired the click event
          // There could definitely be a better way to do this
          this.parents(".request-container").remove();
        }.bind($(this))
      );
    });
});

// Autofill song log form with request info
function autofillLogSongForm(request) {
  $("#title").val(request.title);
  $("#artist").val(request.artist);
  $("#requested_by").val(request.requested_by);
}
