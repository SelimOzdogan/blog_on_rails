class CommentsController < ApplicationController
  before_action :authenticated_user!, except: [:index, :show]
  
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new comment_params
    @comment.user = @current_user
    @comment.post = @post
    if @comment.save
      redirect_to @post
    else
      @comments = @post.comments.order(created_at: :desc)
      render "posts/show"
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
