class Admin::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @posts = Post.all
    #puts "!!!!!!!!!!!!!!!!!#{@post_2_id}"
  end

  def checkout
    @post_2_id = Post.find(params[:id])
    puts "!!!!!!!!!!!!!!!!!#{@post_2_id}"
    redirect_to admin_posts_path(@post_2_id)
  end

  def confirm_order
    @post = Post.find(params[:id])
    #@post.post_2_id = 
  end

end