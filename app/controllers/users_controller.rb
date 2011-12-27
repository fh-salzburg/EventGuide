class UsersController < BaseController
#all actions with views are in basecontroller
def index
	if session[:permission] < 2
		redirect_to root_url
	else
	  @admins = User.where("type == 2").order("email")
    @guides = User.where("type == 1").order("email")
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
  
 def login
    #here is login function
  end
end
