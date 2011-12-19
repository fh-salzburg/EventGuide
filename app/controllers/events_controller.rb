class EventsController < BaseController
	before_filter :get_eventlist,  :only => [:index]
	before_filter :get_eventdetail,  :only => [:show, :edit, :update, :destroy]
	
	def index	
	end
	
	def show
	end
	
	def new
		@event = Event.new
	end
	
	def create		
		event.create(params[:event])
		redirect_to Event
	end
	
	def edit
	end
	
	def update
		event.update_attributes(params[:event])
		redirect_to Event
	end
	
	def destroy
		event.delete
		redirect_to Event
	end
	
	#def get_eventlist
	#	@events = Event.all
	#end
	
	def get_eventdetail
		@event = Event.find(params[:id])
	end
end
