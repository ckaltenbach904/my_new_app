class UserMailer < ApplicationMailer
    default from: "sfdabilene2006@gmail.com"
  
    def contact_form(email, name, message)
    @message = message
      mail(from: email,
           to: "sfdabilene2006@gmail.com",
           subject: "A new contact form message from #{name}")
    end
end