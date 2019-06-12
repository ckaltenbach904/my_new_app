require 'rails_helper'

describe OrdersController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end 
    let(:product) { Product.create!(name:"XYZ Bicycle", description:"Lorem Ipsum", image_url:"bike.jpg", colour:"white", price: 0.00 )}
    
    let(:order) { Order.create!(user: @user, product: product, total: product.price) }


    describe 'GET #show' do
      context 'when a user is logged in' do
        before do
          sign_in @user
        end

          it "loads correct the user's order details" do
            get :show, params: {id: order.id}
            expect(response).to be_ok  
            expect(assigns(:order)).to eq order
          end
      end
    end
  end

