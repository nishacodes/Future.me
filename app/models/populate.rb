class Populate
  attr_reader :api, :scraper, :company, :location, :person, :industry

  DOMAINS = ["google.com, twitter.com, flatironschool.com"]

  def initialize
  	@api = Api.new
    # @scraper = Scraper.new
  end
  
  def run
    create_company
    create_industry
    create_location
    create_people
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

end

