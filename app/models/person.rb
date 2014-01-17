class Person < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :linkedin_id, :publicProfileUrl
  validates_uniqueness_of :linkedin_id

  has_many :jobtitles
  
  has_many :person_schools
  has_many :schools, :through => :person_schools

  has_many :company_people
  has_many :companies, :through => :company_people 
end
