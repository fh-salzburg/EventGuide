class EventsController < BaseController
  #all actions with views are in basecontroller

  def index
    @allevents = Event.all
  end

  def new
    @event = Event.new
  end
  
  def create
    if isAdmin
      @event = Event.new(params[:event])
      if @event.save
        redirect_to events_path, :notice => "Event gespeichert!"
      else
      render "new"
      end
    else
      redirect_to root_url
    end
  end

def edit
  if isAdmin
    @event = Event.find(params[:id])
  else
    redirect_to root_url
  end
end

def update
  if isAdmin
    event = Event.find(params[:id])
    event.update_attributes(params[:event])
    redirect_to events_path
  else
    redirect_to root_url
  end
end


  def destroy
    if isAdmin
      event = Event.find(params[:id])
      event.delete
      redirect_to events_path
    else
      redirect_to root_url
    end
  end 
  
end
