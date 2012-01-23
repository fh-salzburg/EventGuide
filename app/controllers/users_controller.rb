# encoding: utf-8
class UsersController < ApplicationController

  before_filter :is_admin?
  def index
    @adminUsers = User.where("usertype = 'admin'").order("email ASC")
    @guides = User.where("usertype = 'guide'").order("email ASC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User erstellt"
      redirect_to users_path
    else
      flash[:error] = "User konnte nicht erstellt werden"
      redirect_to users_path
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      flash[:notice] = "User editiert"
    else
      flash[:error] = "User konnte nicht editiert werden"
    end
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:id])
    if user.delete
      flash[:notice] = "User gel&ouml;scht"
    else
      flash[:error] = "User konnte nicht gel&ouml;scht werden"
    end
    redirect_to users_path
  end

end
