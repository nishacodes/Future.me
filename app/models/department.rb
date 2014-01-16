class Department < ActiveRecord::Base
  attr_accessible :name

  has_many :company_departments
  has_many :companies, :through => :company_departments
end
