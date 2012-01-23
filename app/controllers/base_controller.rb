# encoding: utf-8
class BaseController < ApplicationController

  before_filter :get_eventlist,  :only => [:index, :show, :ranking, :stations, :new, :create, :edit, :search]
  before_filter :get_timed_eventlist, :only => [:timed_events]
  
  def index
    @welcome = "Welcome to FHS EventGuide! :)"
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
    @visitors = Visitor.where("number_of_stars > 0").order("number_of_stars DESC");
    @rank = 1;
  end

end
