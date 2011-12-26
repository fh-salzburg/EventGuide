class EventsController < BaseController
	#all actions with views are in basecontroller
	def new
		@event = Event.new
	end
end
