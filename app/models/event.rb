class Event < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :room
  attr_accessible :time_from
  attr_accessible :time_to
  attr_accessible :isAStation
  attr_accessible :description
  attr_accessible :short_description
  attr_accessible :image
  
  validates_presence_of :title, :on => :create, :message => "angeben"
  validates_presence_of :room, :on => :create, :message => "angeben"
  validates_presence_of :isAStation, :on => :create, :message => "angeben"
  validates_presence_of :description, :on => :create, :message => "angeben"
  validates_presence_of :short_description, :on => :create, :message => "angeben"

end
