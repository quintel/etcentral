class PostsController < ApplicationController

  def index
    @posts = Post.all.sort
  end

  def show
    @post = Post.find(params[:id])
  end

end
