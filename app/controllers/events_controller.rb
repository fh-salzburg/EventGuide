class Event < ApplicationController
#alle Methoden die hier stehen werden auf die static_event.rb und timed_event.rb vererbt

  def index
    @events = Event.all
  end
 
  def show()
    @events = Event.find(pararms[:id])
  end
end
