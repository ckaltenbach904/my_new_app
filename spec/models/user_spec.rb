require 'rails_helper'

describe User do
    context "when user is present" do

        it "is valid with email and password" do
            expect(User.new(email: "j.smith@example.com", password: "foobar")).to be_valid
        end

        it "is not valid without email" do
            expect(User.new(password: "foobar")).to_not be_valid
        end

    end
end