class CompanyPerson < ActiveRecord::Base
  # validates_uniqueness_of :company_id, :scope => :person_id

  belongs_to :company
  belongs_to :person
  
end

