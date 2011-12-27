class EventsController < BaseController
  #all actions with views are in basecontroller
  def new
    @event = Event.new
  end

  def list
    @events = Event.all
  end

end
