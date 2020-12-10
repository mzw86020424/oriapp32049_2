class PostsController < ApplicationController
  def index
    t = Time.new
    @post = Post.new
    @posts = Post.where(user_id: current_user.id).where(month: t.month).where(year: t.year)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render root_path
    end
  end

  
  def post_params
    t = Time.new
    params.require(:post).permit(:url).merge(user_id: current_user.id, month:t.month, year:t.year)
  end
end