class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			session[:permission] = user.usertype
			redirect_to root_url, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email or password"
			render "new"
		end
	end

	def destroy
	session[:user_id] = nil
	session[:permission] = 0
	redirect_to root_url, :notice => "Logged out!"
	end

end
