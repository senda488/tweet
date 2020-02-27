class PostsController < ApplicationController
  # before_action :post_edit_show, only:[:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end  

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def search
    @posts = Post.search(params[:keyword])
  end  

  private
  def post_params
    params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
  end 


  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
