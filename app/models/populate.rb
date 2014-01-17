class Populate
  attr_reader :api, :scraper, :company, :location, :person, :industry, :scrape

  DOMAINS = ["google.com, twitter.com, flatironschool.com"]

  def initialize
  	@api = Api.new
    create_company
    create_industry
    create_location
<<<<<<< HEAD
    update_people
    # @scraper = Scraper.new
=======
    create_people
>>>>>>> a71952d0a0b083f03b05740acd16618ca6ae2b46
  end

  def create_company
    @api.find_company(DOMAINS.last)
    @company = Company.create(:name => @api.company_name, :linkedin_id => @api.company_id)
  end

  def create_industry    
    @industry = Industry.create(:name => @api.company_industry)
    @industry.companies << @company
    # @company.industries << @industry
  end

  def create_location
    @location = Location.create(:postalcode => @api.company_postalcode)
    @company.locations << @location
    # @location.companies << @company
  end

  def create_people
    @api.people.each do |personhash|
      Person.create(:firstname => personhash["firstName"], :lastname => personhash["lastName"],
    :linkedin_id => personhash["id"], :linkedin_url => personhash["publicProfileUrl"])
    end
  end

<<<<<<< HEAD

  def update_people
    Person.all.each do |person|
      @scrape = Scraper.new(person.linkedin_url)
      
      @scrape.schools.each do |school|
        person.schools << School.create(:name => school[:name])
        person.educations <<

      end


    end
  end







=======
>>>>>>> a71952d0a0b083f03b05740acd16618ca6ae2b46
end

