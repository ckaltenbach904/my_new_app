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
        it "is not valid without a name" do
            expect(Product.new(colour:"magenta", price: 4, image_url: "bike.jpg", description: "lorem ipsum"))
        end
        it "is not valid without a description" do
            expect(Product.new(name: "xyz", colour:"magenta", price: 4, image_url: "bike.jpg"))
        end
        it "is not valid without an image" do
            expect(Product.new(name: "xyz", colour:"magenta", price: 4, description: "lorem ipsum"))
        end
        it "is not valid without a colour" do
            expect(Product.new(name: "xyz", image_url: "bike.jpg", price: 4, description: "lorem ipsum"))
        end
        it "is not valid without a price" do
            expect(Product.new(name: "xyz", image_url: "bike.jpg", colour: "blue", description: "lorem ipsum"))
        end
        it "is not valid with a non-numerical price" do
            expect(Product.new(name: "xyz", image_url: "bike.jpg", price: "ten", colour: "blue", description: "lorem ipsum"))
        end
    end
end
