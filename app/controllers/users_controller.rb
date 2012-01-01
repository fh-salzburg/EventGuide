class UsersController < BaseController
#all actions with views are in basecontroller

def index
    if isAdmin
  	  @adminUsers = User.where("usertype = 'admin'").order("email ASC")
      @guides =     User.where("usertype = 'guide'").order("email ASC")
    else
      redirect_to root_url
    end
end

def new
	if isAdmin
    @user = User.new
	else
    redirect_to root_url
	end
end

def create
  if isAdmin
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to users_path, :notice => "User erstellt!"
  	else
  	render "new"
  	end
  else
    redirect_to root_url
  end
end

def show
end

def edit
  if isAdmin
    @user = User.find(params[:id])
  else
    redirect_to root_url
  end
end

def update
  if isAdmin
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to users_path
  else
    redirect_to root_url
  end
end

def destroy
  if isAdmin
    user = User.find(params[:id])
    user.delete
    redirect_to users_path
  else
    redirect_to root_url
  end
end 
  
end
