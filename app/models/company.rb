class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :jobtitles
  has_many :schools

  has_many :company_industries
  has_many :industries, :through => :company_industries

  has_many :company_departments
  has_many :departments, :through => :company_departments
  
  has_many :company_people
  has_many :people, :through => :company_people

  has_many :company_locations
  has_many :locations, :through => :company_locations
  


end
