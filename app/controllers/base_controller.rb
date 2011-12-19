class BaseController < ApplicationController
	require "event.rb"
	require "visitor.rb"
	require "user.rb"
	
	before_filter :get_eventlist,  :only => [:index, :show]	
	
	def index
		@welcome = "Welcome to FHS EventGuide! :)"
	end
	
	def get_eventlist
		@events = Event.all
	end
	
	def show
	end
end
