class UsersController < ApplicationController
  
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
      flash[:success] = "You have signed up successfully"
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to posts_path
    else
      
      render 'new' 
    end
  end

  def show
    @post= Post.find(params[:id])
    #@comment=@post.comments.new
    @comment = Comment.new
    #@new_comment = @post.comments.build
    @comments = @post.comments.reverse
    #respond_with @post
  end


  protected

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end



  end
