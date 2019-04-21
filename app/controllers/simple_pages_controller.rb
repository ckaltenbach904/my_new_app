class SimplePagesController < ApplicationController
  def index
  end

  def contact
  end

  def thank_you
    flash[:notice] = "Your query has been received!"
    redirect_to root_path
  end
end
