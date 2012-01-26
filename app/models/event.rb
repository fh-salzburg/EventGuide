class Event < ActiveRecord::Base
  attr_accessible :title
  attr_accessible :room
  attr_accessible :time_from
  attr_accessible :time_to
  attr_accessible :isAStation
  attr_accessible :description
  attr_accessible :short_description
  attr_accessible :image

  attr_accessible :photo
  has_attached_file :photo, :styles => { :small => "800x300>" },
                    :url  => "/assets/images/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  validates_presence_of :title, :on => :create, :message => "angeben"
  validates_presence_of :room, :on => :create, :message => "angeben"
  validates_presence_of :description, :on => :create, :message => "angeben"
  validates_presence_of :short_description, :on => :create, :message => "angeben"
  validates_inclusion_of :isAStation, :in => [true, false]
  #validates_attachment_presence :image
  #validates_attachment_size :image, :less_than => 1.megabytes, :message => "zu gross"
  #validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png'], :message => "nur jpg oder png erlaubt"

end
