class ZinesController < ApplicationController
  def index
    @zines = Zine.where(user_id: current_user.id)
  end
  def show
    @zine = Zine.find(params[:id])
    @posts = Post.where(user_id: current_user.id).where(month: @zine.month).where(year: @zine.year).order("created_at DESC")
  end
end
