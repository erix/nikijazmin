class Admin::AdminController < ApplicationController
  layout "admin"

  private
  def authorize
    redirect_to admin_login_path if current_user.nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
