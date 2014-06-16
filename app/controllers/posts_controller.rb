class PostsController < ApplicationController
  def index
    @posts= Post.all.reverse
  end

  def show
    @post= Post.find(params[:id])
    respond_with @post

  end

  def new
    @post= Post.new
  end

  def create
    @post =Post.new(params.require(:post).permit(:topic))
    @post.user = current_user
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
  
end
