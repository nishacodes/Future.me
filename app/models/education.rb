class Education < ActiveRecord::Base
  attr_accessible :grad_yr, :kind, :major, :person_id, :school_id

  belongs_to :person
  belongs_to :school
end

# COMMAND LINE, UPDATE KIND AND MAJOR
# educations = Education.all
# educations.each do |e|
#   match = /([^,]*),? ?(.*)/.match(e.kind)
#   e.update_attributes(:kind=>match[1],:major=>match[2]) if match
# end