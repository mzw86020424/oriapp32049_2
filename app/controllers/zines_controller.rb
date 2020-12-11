class ZinesController < ApplicationController
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
  
  private
  
  def zine_params
    t = Time.new
    params.permit(:release).merge(user_id: current_user.id, month: t.month, year: t.year) 
  end
end
