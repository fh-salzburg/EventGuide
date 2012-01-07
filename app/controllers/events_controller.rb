class EventsController < BaseController
  #all actions with views are in basecontroller
  def index
    if is_admin
      @allevents = Event.all
    else
      redirect_to root_url
    end      
  end

  def new
    if is_admin
      @event = Event.new
    else
      redirect_to root_url
    end
  end

  def create
    if is_admin
      params[:event][:image] = "test.jpg"
      event = Event.new(params[:event])
      if event.save
        flash[:notice] = "Event gespeichert"
      else
        flash[:error] = "Event konnte nicht gespeichert werden"
      end
      redirect_to events_url
    else
      redirect_to root_url
    end
  end

  def edit
    if is_admin
      @event = Event.find(params[:id])
    else   
      redirect_to root_url
    end
  end

  def update
    if is_admin
      event = Event.find(params[:id])
      if event.update_attributes(params[:event])
        flash[:notice] = "Event editiert"
      else
        flash[:error] = "Event konnte nicht editiert werden"
      end
      redirect_to events_path
    else
      redirect_to root_url
    end
  end

  def destroy
    if  is_admin
      event = Event.find(params[:id])
      if event.delete
        flash[:notice] = "Event gel&ouml;scht"
      else
        flash[:error] = "Event konnte nicht gel&ouml;scht werden"
      end
      redirect_to events_path
    else
      redirect_to root_url
    end
  end

end
