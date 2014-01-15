class School < ActiveRecord::Base
  attr_accessible :location_id, :name

  has_many :person_schools
  has_many :people, :through => :person_schools
  
  has_one :location
end
