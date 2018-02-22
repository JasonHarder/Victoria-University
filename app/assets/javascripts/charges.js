<script src="https://checkout.stripe.com/checkout.js"></script>



<script>
var handler = StripeCheckout.configure({
  key: '<%= Rails.configuration.stripe[:publishable_key] %>',
  locale: 'auto',
  name: 'Victoria University',
  description: 'One-time donation',
  token: function(token) {
    $('input#stripeToken').val(token.id);
    $('form').submit();
  }
});
</script>

// if we will be using BABEL that const can stay as is , but ensure babel transpiler is included otherwise switch back to es5.