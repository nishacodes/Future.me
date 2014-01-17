class Person < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :linkedin_id, :linkedin_url
<<<<<<< HEAD
  validates :linkedin_id, uniqueness: true, presence: true
  validates :linkedin_url, uniqueness: true, presence: true
=======
  validates_uniqueness_of :linkedin_id
>>>>>>> a71952d0a0b083f03b05740acd16618ca6ae2b46

  has_many :jobtitles
  
  has_many :person_schools
  has_many :schools, :through => :person_schools

  has_many :company_people
  has_many :companies, :through => :company_people 
end
