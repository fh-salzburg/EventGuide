class UsersController < BaseController
#all actions with views are in basecontroller
def index
	if session[:permission] < 2
		redirect_to root_url
	else
	  @adminUsers = User.where("usertype = 'admin'").order("email ASC")
    @guides =     User.where("usertype = 'guide'").order("email ASC")
	end
end

def new
	if session[:permission] < 2
		redirect_to root_url
	else
		@user = User.new
	end
end

def create
	@user = User.new(params[:user])
	if @user.save
		redirect_to root_url, :notice => "Signed up!"
	else
	render "new"
	end
end

def edit
  @user = User.find(params[:id])
end

def update
  user = User.find(params[:id])
  user.update_attributes(params[:user])
  redirect_to user
end

def destroy
  user = User.find(params[:id])
  user.delete
  redirect_to user
end 
  
end
