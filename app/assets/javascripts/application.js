//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree

(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    let panel = $(this).parent().parent();
    let messages_list = panel.find('.messages-list');

    panel.find('.panel-body').toggle();
    panel.attr('class', 'panel panel-default');

    if (panel.find('.panel-body').is(':visible')) {
      let height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();

