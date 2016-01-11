var welcome = {
  init: function() {
    this.bindUIElements();
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
};
