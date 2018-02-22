//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree


  document.addEventListener("DOMContentLoaded", function(event) {
    console.log("layout DOM fully loaded and parsed");
 


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
  
  window.onscroll = function() {myFunction()};

    var stickyprop = document.querySelector(".stickyproposal");
    var sticky = stickyprop.offsetTop;

  function myFunction() {
    if (window.pageYOffset >= sticky) {
      stickyprop.classList.add(".sticky")
    } else {
      stickyprop.classList.remove(".sticky");
    }
  }
});