class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render root_path
    end
  end

  private
  
  def post_params
    t = Time.new
    params.permit(:url).merge(user_id: current_user.id, month:t.month, year:t.year, zine_id: params[:zine_id])
  end
end