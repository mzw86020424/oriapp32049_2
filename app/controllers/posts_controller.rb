class PostsController < ApplicationController
  def index
    t = Time.new
    if Zine.where(month: t.month).where(year: t.year).where(user_id: current_user.id).exists?
      @zine = Zine.where(month: t.month).where(year: t.year).where(user_id: current_user.id)
    else
      @zine = Zine.new
      @zine = Zine.create(zine_params)
    end
    @post = Post.new
    @posts = Post.where(user_id: current_user.id).where(month: t.month).where(year: t.year).order("created_at DESC")
  end
  
  def create
    t = Time.new
    @zine = Zine.where(month: t.month).where(year: t.year).where(user_id: current_user.id)
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render root_path
    end
  end
    
  private
  
  def zine_params
    t = Time.new
    params.permit(:release).merge(user_id: current_user.id, month: t.month, year: t.year) 
  end
  
  def post_params
    t = Time.new
    params.require(:post).permit(:url).merge(user_id: current_user.id, month:t.month, year:t.year, zine_id: @zine.ids[0])
  end 
end