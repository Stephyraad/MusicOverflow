class PostsController < ApplicationController

  before_action :set_post, :only => [:show, :edit, :update, :destroy]
  
  def welcome
  end

  def index
    
      @posts= Post.where.not(user_id: current_user.id).reverse
   

    
  end

  def show
    @post= Post.find(params[:id])
    #@comment=@post.comments.new
    @comment = Comment.new
    #@new_comment = @post.comments.build
    @comments = @post.comments.reverse
    #respond_with @post

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
    redirect_to :root
  end

  def set_post
    @post= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:topic)
  end

  def comment_params
    params.require(:comment).permit(:text_comment)
  end
  
end
