class Person < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :linkedin_id

  has_many :jobtitles
  has_many :schools
  has_many :companies
end
