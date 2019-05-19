class SimplePagesController < ApplicationController
  # layout "static"
  def index
  end

  def contact
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
    flash[:notice] = "Your query has been received!"
    redirect_to root_path
  end
  
  def landing_page
    @featured_products = Product.limit(3)
  end

end
