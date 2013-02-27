class Admin::PostsController < Admin::AdminController
  before_filter :authorize

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "Post created"
      redirect_to [:admin, @post]
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated"
      redirect_to [:admin, @post]
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post destroyed"
    redirect_to admin_posts_url
  end

  def publish
    p = Post.find(params[:id])
    if not p.nil?
      p.published_at = Time.now
      p.save!
    end
    redirect_to admin_posts_path
  end
end
