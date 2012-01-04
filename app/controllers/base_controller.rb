class BaseController < ApplicationController
  require "event.rb"
  require "visitor.rb"
  require "user.rb"
  require "subscription.rb"

  before_filter :get_eventlist,  :only => [:index, :show, :ranking, :stations, :new, :create, :edit]
  before_filter :get_timed_eventlist, :only => [:timed_events]
  before_filter :get_permission

  def is_admin
    if @permission == "admin"
    return true
    else
    return false
    end
  end

  def is_guide
    if @permission == "guide" || @permission == "admin"
    return true
    else
    return false
    end
  end

  def index
    @welcome = "Welcome to FHS EventGuide! :)"
  end

  def get_permission
    user = User.find_by_id(session[:user_id])
    if user
    @permission = user.usertype
    else
      @permission = "visitor"
    end
  end

  #Actions which need the Event-Model
  def show
    @event = Event.find(params[:id])
  end

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

  #Actions which need the Visitor-Model
  def ranking
    @visitors = Visitor.order("number_of_stars DESC");
    @rank = 1;
  end

end
