document.addEventListener("DOMContentLoaded", function () {
  const handler = StripeCheckout.configure({
    key: 'pk_test_6pRNASCoBoKtISHfeqd4xmuh'
    image: 'https://stripe.com/img/documentation/checkout/marketplace.png',
    locale: 'auto'
    token: function(token){
      //get the token id to your serverside code for use (ENV variable?)
    }
  })
}

document.getElementById('Paymentfield').addEventListener('click',function(e){
  handler.open({
    name:'Stripe.com',
    description: '2 widgets',
    zipcode:true,
    amount:2000
  });
  e.preventDefault();
});

window.addEventListener('popstate',function () {
  handler.close();
});

// if we will be using BABEL that const can stay as is , but ensure babel transpiler is included otherwise switch back to es5.