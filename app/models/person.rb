class Person < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :linkedin_id, :linkedin_url
  validates :linkedin_id, uniqueness: true, presence: true
  validates :linkedin_url, uniqueness: true, presence: true

  has_many :jobtitles
  has_many :educations
  
  has_many :person_schools
  has_many :schools, :through => :person_schools

  has_many :company_people
  has_many :companies, :through => :company_people 
end