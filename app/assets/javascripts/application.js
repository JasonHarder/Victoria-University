//= require jquery
//= require jquery_ujs
//= require rails-ujs
//= require_tree

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


  <
  button id = "customButton" > Purchase < /button>

  <
  script >
  var handler = StripeCheckout.configure({
    key: 'pk_test_6pRNASCoBOKtIshFeQd4XMUh',
    image: 'https://stripe.com/img/documentation/checkout/marketplace.png',
    locale: 'auto',
    token: function (token) {
      // You can access the token ID with `token.id`.
      // Get the token ID to your server-side code for use.
    }
  });

document.getElementById('customButton').addEventListener('click', function (e) {
  // Open Checkout with further options:
  handler.open({
    name: 'Stripe.com',
    description: '2 widgets',
    zipCode: true,
    amount: 2000
  });
  e.preventDefault();
});

// Close Checkout on page navigation:
window.addEventListener('popstate', function () {
  handler.close();
}); <
/script>