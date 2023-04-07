class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def new
     @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    post.save
    redirect_to post_path
  end
  
  def index
    @user = current_user
    @post = Post.new
  end

  def show
    @Post = Post.new
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  private

  def post_params
    params.require(:post).permit(:image,:title,:body)
  end
  
  def  is_matching_login_user
    @post = Post.find(params[:id])
   unless @post.user == current_user
     redirect_to posts_path
   end
  end
  
end
