class Jobtitle < ActiveRecord::Base
  attr_accessible :company_id, :end_date, :person_id, :start_date, :title

  has_one :company
  belongs_to :person
end
