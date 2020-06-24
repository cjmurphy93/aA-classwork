require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    subject(:user){create(:user)}
    describe "get#index" do
        it "renders the users#index" do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "get#show" do
        it "renders user#show" do 
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)
        end
    end

    describe "post#create" do

        context "with invalid params" do
            it "validates the presence of username and password" do
                post :create, params: {user: {banana: "abc123", password: "startrek"}}
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end

            it "validates the length of the password is at least 6" do
                post :create, params: {user: { password: "star"}}
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end
        end

        context "with valid params" do
            # before :each do 
            #     create(:user {})
            # end
            it "redirects user to sign in page if successful" do
                post :create, params: {user: {username: "abc123", password: "starwars"}}
                expect(response).to redirect_to(users_url)
            end
        end
    end
end
