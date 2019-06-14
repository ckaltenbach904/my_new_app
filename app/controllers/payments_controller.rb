class PaymentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @user=current_user
        puts params 
        @product = Product.find(params[:product_id])
        puts @product
        token = params[:stripeToken]
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          charge = Stripe::Charge.create(
            amount: @product.price_in_cents, 
            currency: "eur",
            source: token,
            description: params[:stripeEmail],
            receipt_email: params[:stripeEmail]
          )
          if charge.paid
            Order.create(
                product_id: @product.id,
                user_id: @user.id,
                total: @product.price_in_cents
            )
          end
        rescue Stripe::CardError => e
            # The card has been declined
            body = e.json_body
            err = body[:error]
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
          # The card has been declined
        end
    end
end
