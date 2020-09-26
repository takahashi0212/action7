class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :index]
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

    def top
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :name, :description, :category_id, :price).merge(user_id: current_user.id)
  end
end
