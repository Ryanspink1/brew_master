class Admin::BaseController < ApplicationController
  before_action :current_admin

  def current_admin
    redirect_to home_path unless current_admin?
  end
end
