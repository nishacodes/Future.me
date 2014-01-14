class Location < ActiveRecord::Base
  attr_accessible :city, :country, :lat, :long, :state

  has_many :companies
  has_many :schools
end
