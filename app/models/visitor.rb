class Visitor < ActiveRecord::Base
   attr_accessible :number, :name, :email, :mobile, :interests, :number_of_stars
   
   validates_presence_of :number, :on => :create, :message => 'angeben'
   validates_presence_of :number_of_stars, :on => :create, :message => 'angeben'
   validates_numericality_of :number, :on => :create, :message => 'ist keine Zahl'
   validates_uniqueness_of :number, :on => :create, :message => 'ist schon vorhanden'
   
  #subscriptions
  has_many :subscriptions
  has_many :users, :through => :subscriptions
end
