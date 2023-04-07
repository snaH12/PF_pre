class Public::UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  
  def index
    @user = current_user
    @users = User.all
    @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
end