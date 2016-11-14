class Admin::PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @posts = Post.where('id NOT IN (SELECT DISTINCT poster_id FROM orders)
                                   AND id NOT IN (SELECT DISTINCT asker_id FROM orders)')
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

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
