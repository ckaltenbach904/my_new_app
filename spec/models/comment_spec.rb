require 'rails_helper'

describe Comment do 
    context "when a comment gets created" do
    	let(:product){ Product.create!(name: "race bike", colour: "black", price: 0.00, image_url: "bike.jpg", description: "bla bla")}
        let(:user){ User.create!(email: "j.smith@example.com", password: "foobar")}
        
        it "is not valid without a product" do
            expect(Comment.new(user: user, body: "Lorem Ipsum")).to_not be_valid
        end

        it "is not valid without a user" do
          expect(Comment.new(product: product, body: "Lorem Ipsum")).to_not be_valid
        end

        it "is not valid without a rating" do
            expect(Comment.new(product: product, user: user, body: "Lorem Ipsum")).to_not be_valid
        end

        it "is valid with a user and a product and a rating" do
            expect(Comment.new(product: product, user: user, body: "Lorem Ipsum", rating: 4)).to be_valid
        end

    end
end