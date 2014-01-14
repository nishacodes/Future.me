class Education < ActiveRecord::Base
  attr_accessible :grad_yr, :kind, :major, :person_id, :school_id

  belongs_to :person
  belongs_to :school
end
