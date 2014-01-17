class Populate
  attr_reader :api, :scraper

	#create a company
  def initialize
  	@api = Api.new
    # @scraper = Scraper.new
  end

  def create_company
    domain = "google.com"
    company = @api.find_company_id(domain)
    new_company = Company.create(:name => company["name"], :linkedin_id => company["id"])
    
    company_details = @api.company_details(company["id"])
    new_industry = Industry.create(:name => company_details["industries"]["values"][0]["name"])
    new_industry.companies << new_company
    # new_company.industries << new_industry

    new_location = Location.create(:postalcode => company_details["locations"]["values"][0]["address"]["postalCode"])
    new_company.locations << new_location
    # new_location.companies << new_company

  end
end