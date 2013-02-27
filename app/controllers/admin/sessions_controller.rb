class Admin::SessionsController < Admin::AdminController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      redirect_to admin_posts_path
    else
      render new
    end
  end
end
