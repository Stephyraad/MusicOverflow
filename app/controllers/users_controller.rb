class UsersController < ApplicationController
 
  # where the user goes to his profile, this index method only displays posts created by the current user 
  def index
    if params[:filteruser] == "s"
      @posts= Post.where(:user_id => current_user.id).reverse
      puts @posts
    end
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save 
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to posts_path
    else
      render 'new' 
    end
  end

  def show
    @post= Post.find(params[:id])
    @comment = Comment.new 
    @comments = @post.comments.reverse

  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit(:topic, 
                                  comments_attributes: [:text_comment])
  end

  protected

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end



