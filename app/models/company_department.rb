class CompanyDepartment < ActiveRecord::Base
  belongs_to :company
  belongs_to :department
end