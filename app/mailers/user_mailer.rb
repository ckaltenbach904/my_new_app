class UserMailer < ApplicationMailer
    default from: "sfdabilene2006@gmail.com"
  
    def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: "sfdabilene2006@gmail.com",
           subject: "A new contact form message from #{name}")
    end

    def welcome(user)
      @appname = "Bike Berlin"
      mail(to: user.email,
           subject: "Welcome to #{@appname}!")
    end

    def payment_received(order)
      @order = order
      @user = order.user
      @product = order.product

      mail(to: @user.email,
          subject: "Thank you for your payment!"
      )
    end  
end
