class OrdersController < ApplicationController
  before_action :authenticate_user! 
  
    def index
      if current_user.admin?
        @orders = Order.includes(:product)
      else   
        @orders = current_user.orders
      end  
    end
  
    def show
      @order = Order.find(params[:id])
    end
  
    def new
    end
  
    def create
    end
  
    def destroy
    end
end