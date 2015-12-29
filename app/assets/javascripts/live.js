$(document).ready(function() {
  $(".log-song-form").submit(function(event) {
    event.preventDefault();
    data = {
      song: {
        title: $("#title").val(),
        artist: $("#artist").val(),
        requested_by: $("#requested_by").val()
      }
    }
    $.post(
      "/song",
      data,
      function(data) {
        alert("Song logged: " + data.song.title + " by " + data.song.artist);
        $(".log-song-form")[0].reset();
      }
    )
  });
});
