class Populate
  attr_reader :api, :scraper, :company, :location, :person, :industry, :scrape

  DOMAINS = ["google.com", "twitter.com", "flatironschool.com"]

  def initialize
  	@api = Api.new
    create_company
    create_industry
    create_location
    create_people
    update_people
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

  def update_people
    Person.all.each do |person|
      debugger
      @scrape = Scraper.new(person.linkedin_url)
      @scrape.educations.each do |school|
        # debugger
        person.schools << School.create(:name => school[:name])
        education = Education.create(:kind => school[:description], :grad_yr => school[:period],
         :school_id => school, :person_id => person)
      end
    end
  end







end

