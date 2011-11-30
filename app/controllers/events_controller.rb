class EventsController < ApplicationController
	def index
		@events = Event.all
	end
	
	def show
		@event = Event.find(params[:id])
	end
	
	def new
		@event = Event.new
	end
	
	def create		
		event.create(params[:event])
		redirect_to Event
	end
	
	def edit
		@event = Event.find(params[:id])
	end
	
	def update
		event = Event.find(params[:id])
		event.update_attributes(params[:event])
		redirect_to Event
	end
	
	def destroy
		event = Event.find(params[:id])
		event.delete
		redirect_to Event
	end
end
