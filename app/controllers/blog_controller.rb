class BlogController < ApplicationController
  def index
    @posts = Post.published.where(:locale => I18n.locale)
  end

  def show
    @post = Post.find(params[:id])
  end
end
