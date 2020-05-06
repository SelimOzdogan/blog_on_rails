class PostsController < ApplicationController
  before_action :authenticated_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = @current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def index
    @posts = Post.order(updated_at: :desc)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order(updated_at: :desc)
  end

  def update
    if !@post.user.present?
      @post.user = @current_user
    end
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user)
  end

  def find_post
    @post = Post.find params[:id]
  end
end
