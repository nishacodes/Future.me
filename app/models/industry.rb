class Industry < ActiveRecord::Base
  attr_accessible :name
  # validates :name, presence: true
  # validates :name, uniqueness: true

  has_many :company_industries
  has_many :companies, :through => :company_industries

  # reflects number of ppl in an industry
  def value 
  	# self.companies.uniq.size
    people = 0
    self.companies.each do |company|
      company.people.each do |person|
        people +=1
      end
    end
    return people
  end

  def source
    "industries/#{self.id}/companies"
  end
 
end

