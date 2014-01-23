class School < ActiveRecord::Base
  attr_accessible :location_id, :name
  # validates :name, uniqueness: true

  has_many :person_schools
  has_many :people, :through => :person_schools
  has_many :educations
  has_one :location
end
