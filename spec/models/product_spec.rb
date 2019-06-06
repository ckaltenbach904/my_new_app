require 'rails_helper'

describe Product do
    context "Product gets created" do
        let(:product) { Product.create!(name: "race bike", colour: "black", price: 0.00, image_url: "bike.jpg", description: "bla bla") }
        let(:user) { User.create!(first_name:"John", last_name:"Smith", email: "j.smith@example.com", password:"foobar")}
        before do
            product.comments.create!(rating: 1, user: user, body: "Awful bike!")
            product.comments.create!(rating: 3, user: user, body: "Ok bike!")
            product.comments.create!(rating: 5, user: user, body: "Great bike!")
            product.comments.create!(rating: 5, user: user, body: "Great!")
        end
        it "returns the average rating of all comments" do
            expect(product.average_rating).to eq 3.5
        end
        it "fails to validate" do
            expect(Product.new).to_not be_valid
        end
    end
end
