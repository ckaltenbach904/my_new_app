require 'rails_helper'

describe CommentsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
  end

  let(:product){ Product.create!(name: "Berlin Bike", description: "Lorem Ipsum", image_url: "bike.jpg", price: 10, colour: "z")}

    context 'when a user is logged in' do
     before do
       sign_in @user
     end

     it 'can create comment' do
       post :create, params: { product_id: product.id, comment: { body: "great", rating: 5 } }
       expect(assigns(:product)).to eq product
     end
   end
  end