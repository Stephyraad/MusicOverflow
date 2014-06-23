require 'spec_helper'

describe PostsController do
  let :valid_attributes do
    {
      :topic => "whats your favorite song?"
    }
  end

  describe "GET index" do
    let! :post1 do
      Post.create! valid_attributes
    end

    let! :post2 do
      Post.create! valid_attributes
    end

    before do
      get :index
    end

    it "should render the index template" do
      expect(response).to render_template :index
    end

    it "should succeed" do
      expect(response).to be_success
    end

    it "should assign posts to all postss" do
      expect(assigns(:posts)).to include(post1)
      expect(assigns(:posts)).to include(post2)
    end
  end

  describe "GET show" do
    before do
      @post = Post.create! valid_attributes
      get :show, id: @post.id
    end

    it "should render the index template" do
      expect(response).to render_template :show
    end

    it "should succeed" do
      expect(response).to be_success
    end

    it "should assign posts to all posts" do
      expect(assigns(:post)).to eq(@post)
    end
  end

  describe "GET edit" do
    before do
      @post = Post.create! valid_attributes
      get :edit, id: @post.id
    end

    it "should render the index template" do
      expect(response).to render_template :edit
    end

    it "should succeed" do
      expect(response).to be_success
    end

    it "should assign posts to all posts" do
      expect(assigns(:post)).to eq(@post)
    end
  end

  describe "GET new" do
    before do
      get :new
    end

    it "should render the new template" do
      expect(response).to render_template :new
    end

    it "should succeed" do
      expect(response).to be_success
    end

    it "should assign post to be a new post" do
      expect(assigns(:post)).to be_a(Post)
      expect(assigns(:post)).to_not be_persisted
    end
  end

  describe "POST create" do
    describe "successful create" do
      it "should create a post in the database" do
        expect do
          post :create, post: valid_attributes
        end.to change(Post, :count).by(1)
      end

      it "should redirect to the index page for posts" do
        post :create, post: valid_attributes
        expect(response).to redirect_to posts_path
      end
    end

    describe "unable to save" do
      let :invalid_attributes do
        {
          :topic => nil   
        }
      end

      it "should not create any new records in the database" do
        expect do
          post :create, post: invalid_attributes
        end.to_not change(Post, :count).by(1)
      end

      it "should rerender the new template" do
        post :create, post: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT update" do
    before do
      @test_post = Post.create! valid_attributes
    end

    describe "with successful update" do
      let :update_attributes do
        {
          :topic => "whats your favorite song?"
        }
      end

      before do
        put :update, id: @test_post.id, post: update_attributes
      end

      it "should update the post record in the database" do
        expect(@test_post.reload.quantity).to eq(6.0)
      end

      it "should redirect to the index of all posts" do
        expect(response).to redirect_to posts_path
      end
    end
  end


  #   describe "with invalid update attributes" do
  #     let :invalid_update_attributes do
  #       {
  #         :flavor => "chocolate",
  #         :topping => "sprinkles",
  #         :quantity => 25.0
  #       }
  #     end

  #     before do
  #       put :update, id: @test_yogurt.id, yogurt: invalid_update_attributes
  #     end

  #     it "should not update the yogurt record in the database" do
  #       expect(@test_yogurt.reload.quantity).to eq(10.0)
  #     end

  #     it "should rerender the edit view template" do
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end

  describe "DELETE destroy" do
    before do
      @post = Post.create! valid_attributes
    end

    it "should delete a record from the database" do
      expect do
        delete :destroy, id: @post.id
      end.to change(Post, :count).by(-1)
    end

    it "should redirect to the index of all posts" do
      delete :destroy, id: @post.id
      expect(response).to redirect_to root_path
    end
  end
end