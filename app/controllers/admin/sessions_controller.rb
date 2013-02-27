class Admin::SessionsController < Admin::AdminController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_posts_path
    else
      flash[:error] = "Invalid username or password"
      render "new"
    end
  end
end
