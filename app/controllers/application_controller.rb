# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def is_admin?
    return if current_user && current_user.usertype == "admin"
    redirect_to root_path
  end

  def is_guide?
    return if current_user && (current_user.usertype == "guide" || current_user.usertype == "admin")
    redirect_to root_path
  end

end
