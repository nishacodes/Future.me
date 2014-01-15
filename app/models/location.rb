class Location < ActiveRecord::Base
  attr_accessible :city, :country, :lat, :long, :state

  has_many :schools

  has_many :company_locations
  has_many :companies, :through => :company_locations 
end
