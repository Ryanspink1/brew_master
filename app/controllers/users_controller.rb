class UsersController < ApplicationController
  before_action :user!, only: [:show]
  before_action :admin_redirect, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :first_name,
                                 :last_name,
                                 :zip_code,
                                 :password,
                                 :password_confirmation)
  end
end
