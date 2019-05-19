class ApplicationMailer < ActionMailer::Base
  default from: 'sfdabilene2006@gmail.com'
  layout 'mailer'
  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
