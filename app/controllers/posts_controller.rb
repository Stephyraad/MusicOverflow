class PostsController < ApplicationController

  before_action :set_post, :only => [:show, :edit, :update, :destroy]
  
  def welcome
  end

# if the user is not signed in then you can't view the posts and when the user signs in only post NOT created by the user are displayed
  def index
      if !current_user
        @posts= []
      else
      @posts= Post.where.not(user_id: current_user.id).reverse 
    end
  end

# shows the post and the comments related to that post 
  def show
    @post= Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.reverse
  end

 
  def new
    @post= Post.new
  end

  
  def create
    @post =Post.new(params.require(:post).permit(:topic))
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

 
  def edit
    @post= Post.find(params[:id])
  end

  
  def update
    @post= Post.find(params[:id])
    if @post.update_attributes(params.require(:post).permit(:topic))
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

# comments are nested in posts and post_params method permits comments_attributes to be tied to post
  def post_params
    params.require(:post).permit(:topic, 
                                  comments_attributes: [:text_comment])
  end

  def set_post
    @post= Post.find(params[:id])
  end


  def comment_params
    params.require(:comment).permit(:text_comment)
  end
  
end
