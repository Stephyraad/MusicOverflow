require 'spec_helper'

describe SessionsController, type: :controller do
    
    describe "POST create" do

        before do
            @steph = User.create!(name: "Steph", email: "steph@gmail.com", password: "123456")
            post :create, user: @steph
        end


        it "should return the user object" do
            expect("steph@gmail.com").to eq(@steph)
        end

        describe "a valid login" do

            it "should redirect to the post index" do
                expect(response).to redirect_to posts_path
            end

        end


    end
end





