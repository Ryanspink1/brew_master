class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user!
    redirect_to home_path unless current_user
  end

  def current_admin?
  current_user && current_user.admin?
  end

  def current_user_redirect
    if current_user
      redirect_to dashboard_path
    end
  end

  def admin_redirect
    if current_admin?
      redirect_to admin_dashboard_path
    end
  end
end
