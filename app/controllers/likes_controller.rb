class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    @like.save
    
    # @likes = Like.where(post_id: params[:post_id])
    # @posts = Post.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    
  #   @likes = Like.where(post_id: params[:post_id])
  #   @posts = Post.all
  end

  
end
