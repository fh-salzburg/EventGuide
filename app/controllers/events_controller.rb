# encoding: utf-8
class EventsController < ApplicationController

  before_filter :is_admin?, :except => :show
  def index
    @allevents = Event.all
  end

  def show
    @event = Event.find(params[:id]).order("title ASC")
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(params[:event])
    if event.save
      flash[:notice] = "Event gespeichert"
    else
      flash[:error] = "Event konnte nicht gespeichert werden"
    end
    redirect_to events_url
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update_attributes(params[:event])
      flash[:notice] = "Event editiert"
    else
      flash[:error] = "Event konnte nicht editiert werden"
    end
    redirect_to events_path
  end

  def destroy
    event = Event.find(params[:id])
    if event.delete
      flash[:notice] = "Event gel&ouml;scht"
    else
      flash[:error] = "Event konnte nicht gel&ouml;scht werden"
    end
    redirect_to events_path
  end

end
