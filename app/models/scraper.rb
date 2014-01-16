require 'linkedin-scraper'
require 'debugger'

class Scraper
  attr_reader :profile

  def initialize(publicprofileurl)
    @profile = Linkedin::Profile.get_profile("#{publicprofileurl}")
  end

  def create_person
    Person.create(:name => @profile.name)
  end

  def person_id
    Person.last.id
  end

  def education
    schools = @profile.education
    schools.each do |school|
      School.create(:name => school[:name])
      Education.create(:kind => school[:description].split(",")[0], 
        :major => school[:description].split(",")[1], :grad_yr => school[:period], 
        :person_id => , :school_id => )
    end
  end

  def certification
    @profile.certifications
  end

  def current_companies
    companies = @profile.current_companies
    companies.each do |company|
      company_temp = Company.create(:name => company[:company])
      Jobtitle.create(:title=> company[:title], :start_date => company[:start_date],
        :end_date => company[:end_date], :company_id => company_temp.id, :person_id => person_id)
      Location.create() # "Via Esprillo    San Diego,  CA  92127  United States"
    end

  end

  def past_companies
    @profile.past_companies
  end

  def recommended_visitors
    @profile.recommended_visitors
  end

end

a = Scraper.new("http://www.linkedin.com/in/michaelheikkinen?trk=pub-pbmap")

debugger
puts 'hi'