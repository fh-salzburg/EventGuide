class UsersController < BaseController
#all actions with views are in basecontroller
def new
	@user = User.new
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
