class Person < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :linkedin_id, :linkedin_url
  # validates :linkedin_id, presence: true #uniqueness: true,
  # validates :linkedin_url, presence: true #uniqueness: true,

  has_many :jobtitles
  has_many :educations
  
  has_many :person_schools
  has_many :schools, :through => :person_schools

  has_many :company_people
  has_many :companies, :through => :company_people 

  has_many :user_people
  has_many :users, :through => :user_people

  def value
    return 1
  end
end