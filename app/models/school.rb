class School < ActiveRecord::Base
  attr_accessible :location_id, :name

  has_many :people
  has_one :location
end
