# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  before_filter :get_eventlist,  :only => [:index, :show, :ranking, :stations, :new, :create, :edit, :search]
  before_filter :get_timed_eventlist, :only => [:timed_events]
  
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

  def index
    @welcome = "Welcome to FHS EventGuide! :)"
  end


  #actions which are needed
  def stations
    respond_to do |format|
      format.html
      format.js
    end
  end

  def timed_events
    respond_to do |format|
      format.html
      format.js
    end
  end

  def get_timed_eventlist
    @events = Event.where("isAStation" => false).order("time_from DESC")
  end

  def get_eventlist
    @events = Event.where("isAStation" => true).order("title ASC")
  end

end
