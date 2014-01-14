class Location < ActiveRecord::Base
  attr_accessible :city, :country, :lat, :long, :state
end
