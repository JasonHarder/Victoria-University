class ChargesController < ApplicationController
#add code here to charges controller (fixes are needed)
def new
end

def create
  @amount = params[:amount]
  @amount = @amount.gsub('$', '').gsub(',', '')
  begin
    @amount = Float(@amount).round(2)
  rescue
    flash[:error] = 'Charge not completed. Please enter a valid amount.'
    redirect_to new_charge_path
    return
  end

  @amount = (@amount * 100).to_i # Must be an integer!

  if @amount < 500
    flash[:error] = 'Charge not completed. Donation amount must be at least $5.'
    redirect_to new_charge_path
    return
  end

  Stripe::Charge.create({
    :amount => @amount,
    :currency => 'usd',
    :source => 'tok_visa',	#params[:stripeToken] might be for in production I think this is for testing.,
    :description => 'Your Donation to Victoria University',
    :statement_descriptor => 'Victoria University'

    # it seems test tokens must be set as string.
  })

# confirmed that the amount passes correctly as typed.

# how to post a customer ID to a charge so that way it goes thru

# Line .create methods handle post requests to the stripeAPI in this case.

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end

# See stripe docs and work with different controller.

#https://stripe.com/docs/recipes/variable-amount-checkout#javascript