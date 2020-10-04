class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :index, :show, :search]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @message = Message.new
    @messages = @post.messages.includes(:user)
  end

  def top
    @post = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def destroy
    @posts = Post.find(params[:id])
    @posts.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :name, :description, :category_id, :price).merge(user_id: current_user.id)
  end
end
