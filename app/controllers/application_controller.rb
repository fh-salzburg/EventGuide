class ApplicationController < ActionController::Base
	protect_from_forgery
	helper_method :current_user

	private

def isAdmin
  if @permission == "admin"
    return true
  else
    return false
  end
end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
