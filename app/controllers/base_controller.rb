class BaseController < ApplicationController
	require "event.rb"
	require "visitor.rb"
	require "user.rb"
	
	before_filter :get_eventlist,  :only => [:index, :show, :ranking, :events, :timed_events]	
	before_filter :get_eventdetail,  :only => [:show, :edit, :update, :destroy]
	
	def index
		@welcome = "Welcome to FHS EventGuide! :)"
	end

	#Actions which need the Event-Model
	def show
	end
	
  def events
  end
  
  def timed_events
  end
  	
	def get_eventlist
		@events = Event.all
	end
	
	def get_eventdetail
		@event = Event.find(params[:id])
	end
  	
	#Actions which need the Visitor-Model
	def ranking
		@visitors = Visitor.order("number_of_stars DESC");
		@rank = 1;
	end

end
