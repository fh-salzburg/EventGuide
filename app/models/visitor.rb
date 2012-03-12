class Visitor < ActiveRecord::Base
  attr_accessible :name, :email, :mobile, :interests, :number_of_stars

  validates_presence_of :name, :on => :create, :message => 'angeben'
  validates_presence_of :number_of_stars, :on => :create, :message => 'angeben'


  #subscriptions
  has_many :subscriptions
  has_many :users, :through => :subscriptions
end
