class EventsController < BaseController
  #all actions with views are in basecontroller

  def index
    @allevents = Event.all
  end

  def new
    @event = Event.new
  end
  
end
