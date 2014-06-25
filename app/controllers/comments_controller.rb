class CommentsController < ApplicationController
  def index

  end

  def create
  	@post = Post.find(params[:post_id])
  	@comment =@post.comments.new(params.require(:comment).permit(:text_comment))

  	if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    # NOT WORKING YET
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end


end
