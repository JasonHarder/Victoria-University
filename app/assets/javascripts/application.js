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

const panels =document.querySelectorAll('.panel')
	function toggleOpen(){
		this.classList.toggle('open');
	}
	function toggleActive(e) {
		 if (e.propertyName.includes('flex')) {
			this.classList.toggle('open-active');
			}
	}
	panels.forEach(panel => panel.addEventListener('click',toggleOpen));//loopovereachpanel listen for a click and run toggleOpen on each when clicked.
	panels.forEach(panel => panel.addEventListener('transitionend',toggleActive));//loopovereachpanel listen for a click and run toggleOpen on each when clicked.
