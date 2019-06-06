require 'rails_helper'

describe Order do
    context "when order gets created" do
        let(:product){ Product.create!(name: "race bike", colour: "black", price: 0.00, image_url: "bike.jpg", description: "bla bla")}
        let(:user){ User.create!(email: "j.smith@example.com", password: "foobar")}

        it "is not valid without a product" do
            expect(Order.new(user:user)).to_not be_valid
        end

        it "is not valid without a user" do
            expect(Order.new(product:product)).to_not be_valid
        end

        it "is is valid with a user and a product" do
            expect(Order.new(product:product, user:user)).to be_valid
        end
    end
end    
