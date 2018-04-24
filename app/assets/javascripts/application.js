//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree


  document.addEventListener("DOMContentLoaded", function(event) {
    console.log('layout DOM fully loaded and parsed');



  (function() {
    $(document).on('click', '.toggle-window', function(e) {
      e.preventDefault();
      var panel = $(this).parent().parent();
      var messages_list = panel.find('.messages-list');

      panel.find('.panel-body').toggle();
      panel.attr('class', 'panel panel-default');

      if (panel.find('.panel-body').is(':visible')) {
        var height = messages_list[0].scrollHeight;
        messages_list.scrollTop(height);
      }
    });
  })();

  window.onscroll = function() {barStick()};

    var stickyProp = document.querySelector('.stickyproposal');
    var sticky = stickyProp.offsetTop;

  function barStick() {
    if (window.pageYOffset >= sticky) {
      stickyProp.classList.add("sticky")
    } else {
      stickyProp.classList.remove("sticky");
    }
  }
});

$("form.login-box").bind "ajax:success", (e, data, status, xhr) ->
    if data.success
      //javascript that executes if everything goes o.k.
      $('#sign_in').modal('hide')
      $('#sign_in_button').hide()
      $('#submit_comment').slideToggle(1000, "easeOutBack" )
    else
      alert('failure!')