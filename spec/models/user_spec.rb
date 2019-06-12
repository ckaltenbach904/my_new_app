require 'rails_helper'

describe User do
    context "when user is present" do

        it "is valid with email and password" do
            expect(FactoryBot.build(:user)).to be_valid
        end

        it "is not valid without email" do
            expect(FactoryBot.build(:user, email: nil)).to_not be_valid
        end

        it "should not validate users with an invalid email address" do
            @user = FactoryBot.build(:user, email: "not_an_email")
            expect(@user).to_not be_valid
        end

    end
end