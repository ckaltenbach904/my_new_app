class SimplePagesController < ApplicationController
  # layout "static"
  def index
  end

  def contact
  end

  def thank_you
    flash[:notice] = "Your query has been received!"
    redirect_to root_path
  end
  
  def landing_page
    @featured_products = Product.limit(3)
  end

end
