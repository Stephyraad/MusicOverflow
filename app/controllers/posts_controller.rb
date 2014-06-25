class PostsController < ApplicationController

  def welcome
  end

  def index
      if !current_user
        @posts= []
      
      else
      @posts= Post.where.not(user_id: current_user.id).reverse 
    end
  end


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

  def post_params
    params.require(:post).permit(:topic, 
                                  comments_attributes: [:text_comment])
  end

  def comment_params
    params.require(:comment).permit(:text_comment)
  end
  
end
