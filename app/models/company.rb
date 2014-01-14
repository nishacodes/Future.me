class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :industries
  has_many :departments
  has_many :people
  has_many :locations
  has_many :jobtitles, :through => :people
  has_many :schools, :through => :people

end
