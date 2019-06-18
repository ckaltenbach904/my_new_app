class PaymentsController < ApplicationController
    before_action :authenticate_user!
    def create
      logger.info("Payment create called")
        @user=current_user
        puts params 
        @product = Product.find(params[:product_id])
        puts @product
        token = params[:stripeToken]
       # debugger
        # Create the charge on Stripe's servers - this will charge the user's card
        begin
          logger.info("Attempting to create Stripe charge")
          charge = Stripe::Charge.create(
            amount: @product.price_in_cents, 
            currency: "eur",
            source: token,
            description: params[:stripeEmail],
            receipt_email: params[:stripeEmail]
          )
          logger.info("Charge paid: #{charge.paid}")
          if charge.paid
            Order.create(
                product_id: @product.id,
                user_id: @user.id,
                total: @product.price_in_cents
            )
          end
        rescue Stripe::CardError => e
            # The card has been declined
            logger.error("Stripe Card Charge error raised")
            body = e.json_body
            err = body[:error]
            logger.error("Error:  #{err}")
            flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
            # The card has been declined
        rescue Stripe::InvalidRequestError => e
            # The card has been declined
            logger.error("Stripe Invalid Request Error Raised!")
            body = e.json_body
            err = body[:error]
            logger.error("Error:  #{err}")
            flash[:error] = "Unfortunately, there was an error processing payment: #{err[:message]}"
            # The card has been declined
      end
    end
end
