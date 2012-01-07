class Event < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :room
  attr_accessible :time_from
  attr_accessible :time_to
  attr_accessible :isAStation
  attr_accessible :description
  attr_accessible :short_description
  attr_accessible :image

  #has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  #paperclip
  #has_attached_file :image,
   #  :styles => {
    #   :thumb=> "100x100#",
     #  :medium  => "410x175>" }

  validates_presence_of :title, :on => :create, :message => "angeben"
  validates_presence_of :room, :on => :create, :message => "angeben"
  validates_presence_of :isAStation, :on => :create, :message => "angeben"
  validates_presence_of :description, :on => :create, :message => "angeben"
  validates_presence_of :short_description, :on => :create, :message => "angeben"
  #validates_attachment_presence :image
  #validates_attachment_size :image, :less_than => 1.megabytes, :message => "zu gross"
  #validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png'], :message => "nur jpg oder png erlaubt"

end
