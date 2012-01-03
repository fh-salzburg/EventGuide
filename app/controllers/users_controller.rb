class UsersController < BaseController
#all actions with views are in basecontroller

def index
    if is_admin
  	  @adminUsers = User.where("usertype = 'admin'").order("email ASC")
      @guides =     User.where("usertype = 'guide'").order("email ASC")
    else
      redirect_to root_url
    end
end

def new
	if is_admin
    @user = User.new
	else
    redirect_to root_url
	end
end

def create
  if is_admin
  	@user = User.new(params[:user])
  	if @user.save
      flash[:notice] = "User erstellt"
  		redirect_to users_path
  	else
  	  flash[:error] = "User konnte nicht erstellt werden"
      redirect_to users_path
  	end
  else
    redirect_to root_url
  end
end

def show
end

def edit
  if is_admin
    @user = User.find(params[:id])
  else
    redirect_to root_url
  end
end

def update
  if is_admin
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      flash[:notice] = "User editiert"
    else
      flash[:error] = "User konnte nicht editiert werden"
    end
    redirect_to users_path
  else
    redirect_to root_url
  end
end

def destroy
  if is_admin
    user = User.find(params[:id])
    if user.delete
      flash[:notice] = "User gel&ouml;scht"
    else
      flash[:error] = "User konnte nicht gel&ouml;scht werden"      
    end
    redirect_to users_path
  else
    redirect_to root_url
  end
end 
  
end
