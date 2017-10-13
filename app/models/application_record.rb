class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true



  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user!
    redirect_to login_path unless current_user
  end
end
