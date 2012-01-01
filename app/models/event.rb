class Event < ActiveRecord::Base
  attr_accessible :name, :room, :time_from, :time_to, :isAStation, :description, :short_description, :image
  
  validates_presence_of :name, :on => :create, :message => "angeben"
  validates_presence_of :room, :on => :create, :message => "angeben"
  validates_presence_of :isAStation, :on => :create, :message => "angeben"
  validates_presence_of :description, :on => :create, :message => "angeben"
  validates_presence_of :short_description, :on => :create, :message => "angeben"

end
