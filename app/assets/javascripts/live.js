$(document).ready(function() {

  // Handle song logging form submit
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

  // Handle request acknowledge
  $(".btn-acknowledge").on("click", function(event) {
    $.post(
      "/request/acknowledge?id=" + $(this).data("request-id"),
      function(data) {
        this.parents(".request-container").remove();
      }.bind($(this))
    )
  });
});
