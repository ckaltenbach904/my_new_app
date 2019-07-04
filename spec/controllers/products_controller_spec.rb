require 'rails_helper'

describe ProductsController, type: :controller do
    before do
        @user = FactoryBot.create(:user)
        @admin_user = FactoryBot.create(:admin)
    end
        let(:product) { Product.create!(name:"XYZ Bicycle", description:"Lorem Ipsum", image_url:"bike.jpg", colour:"white", price: 0.00 )}
    

    describe 'GET #edit' do
        context 'when a user is logged in' do
            before do
                sign_in @admin_user
            end

            it "can edit product when confimed" do
                get :edit, params: {id: product.id}
                expect(response).to be_ok  
                expect(assigns(:product)).to eq product
            end

        end

    end

    describe 'GET #index' do
        it "renders the index template" do
            get :index
            expect(response).to be_ok
            expect(response).to render_template("index")
        end
    end

    describe 'GET #show' do
        it "renders the show template" do
            get :show, params: {id: product.id}
            expect(response).to be_ok
            expect(response).to render_template("show")
        end
    end

    describe 'GET #new' do
        context 'when a user is logged in' do
            before do
                sign_in @admin_user
            end

            it "renders the new template" do
                get :new
                expect(response).to render_template ("new") 
                expect(response).to be_ok
            end

        end

        context 'when a user is not logged in' do
            it "redirects to home page" do
                get :new
                expect(response).to_not be_ok
                expect(response).to redirect_to "/"
            end    
        end

    end

    describe "POST #create" do
        context 'when a user is logged in' do
            before do
                sign_in @admin_user
            end

            context "with valid attributes" do
                it "should create a new product" do
                    old_count = Product.count
                    post :create, params: {
                        product: {
                            name: "xyz",
                            description: "lorem ipsum",
                            image_url: "bike.jpg",
                            colour: "magenta",
                            price: 500
                        }
                    }
                    new_count = Product.count
                    expect(new_count).to eq old_count + 1
                end
            end

            context "with invalid attributes" do
                it "should not create a new product" do
                    old_count = Product.count
                    post :create, params: {
                        product: {
                            description: "lorem ipsum",
                            image_url: "bike.jpg",
                            colour: "magenta",
                            price: 500
                        }
                    }
                    new_count = Product.count
                    expect(new_count).to eq old_count
                end
            end

        end
    end

    describe "DELETE #destroy" do
        context 'when a user is logged in' do
            before do
                sign_in @admin_user
            end

            it "should delete product" do
                some_product = Product.create!(name:"XYZ Bicycle", description:"Lorem Ipsum", image_url:"bike.jpg", colour:"white", price: 0.00 )
                delete :destroy, params: { id: some_product.id }
            end
        end
    end

    describe "PATCH #update" do
        context 'when a user is logged in' do
            before do
                sign_in @admin_user
            end

            context "with valid attributes" do
                it "should update the product" do
                    put :update, params: {
                        id: product.id,
                        product: {
                            name: "xyz2"
                        }
                    }
                    product.reload
                    expect(product.name).to eq "xyz2"
                end
            end

        end
        context 'when a user is not logged in' do
            it "should not update the product" do
                put :update, params: {
                    id: product.id,
                    product: {
                        name: "xyz2"
                    }
                }
                product.reload
                expect(product.name).to_not eq "xyz2"
            end
        end
    end

end