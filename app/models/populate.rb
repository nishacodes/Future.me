class Populate
  attr_reader :api, :scraper, :company, :location, :person, :industry, :scrape

  DOMAINS = ["google.com", "twitter.com", "flatironschool.com"]
  # DOMAINS = ["google.com", "twitter.com", "flatironschool.com", "amazon.com",
  # "facebook.com", "linkedin.com", "squareup.com", "apple.com", "squarespace.com",
  # "tumblr.com", "etsy.com", "yahoo.com", "salesforce.com", "dropbox.com"]

  # WHILE TESTING, COMMENT OUT THE METHODS U DONT WANT TO RUN
  def initialize
    @api = Api.new
    create_company
    create_industry
    create_location
    create_people
    update_people
  end

  def create_company
    DOMAINS.each do |domain|
      @api.find_company(domain)
        url = "http://www." + domain
        @company = Company.find_or_create_by_name_and_linkedin_id_and_url(@api.company_name, @api.company_id, url)
        create_industry
        create_location
        create_people
        update_people
    end
  end

  def create_industry    
    # WE STILL NEED TO DO THIS FOR CURRENT / PAST COMPANIES
    @industry = Industry.create(:name => @api.company_industry)
    @industry.companies << @company
    @industry.save
  end

  def create_location
    # WE STILL NEED TO DO THIS FOR CURRENT / PAST COMPANIES
    @location = Location.create(:postalcode => @api.company_postalcode)
    @company.locations << @location
    @company.save
  end

  def create_people
    @api.people.each do |personhash|
      Person.create(eval(@api.person_params))
    end
  end

  def update_people
    Person.all.each do |person|
      @scrape = Scraper.new(person.linkedin_url)
      if @scrape.profile
        create_schools_and_educations(@scrape, person)
        create_current_companies(@scrape, person)
        create_past_companies(@scrape, person)
      end
    end
  end

  # THE IDEA HERE IS TO SEPARATE UPDATE_PEOPLE INTO SPECIFIC METHODS BUT THERE'S A SCOPE PROBLEM BC LOCAL VARIABLES DON'T CARRY OVER
  # ALSO WE ONLY WANT TO CREATE 1 INSTANCE OF SCRAPER PER PERSON, THAT'S WHY ALL THE METHODS ARE

  def create_schools_and_educations(scrape, person)
    @scrape.educations.each do |school|
      this_school = School.create(eval(@scrape.school_params))
      person.schools << this_school
      education = Education.create(eval(@scrape.education_params)) # eval is a method that removes quotes from a string, so in this case it turns it into a hash
      person.educations << education
      # Save this after shoveling
      person.save
    end
  end

  def create_current_companies(scrape, person)
    @scrape.current_companies.each do |company|
      this_company = Company.create(eval(@scrape.company_params))
      person.companies << this_company

      if this_company.address
        matchdata = this_company.address.match(/\d{5}/)
        if matchdata
          postalcode = matchdata[0]
          this_location = Location.create(:postalcode => postalcode)
        end
        this_company.locations << this_location
        this_company.save
      end

      this_industry = Industry.create(eval(@scrape.company_industry))
      if this_company.industries
        this_company.industries << this_industry
        this_company.save
      end

      jobtitle = Jobtitle.create(eval(@scrape.jobtitle_params))
      person.jobtitles << jobtitle
      # Save this after shoveling
      person.save
    end
  end

  def create_past_companies(scrape, person)
    @scrape.past_companies.each do |company|
      this_company = Company.create(eval(@scrape.company_params))
      person.companies << this_company

      if this_company.address
        matchdata = this_company.address.match(/\d{5}/)
        if matchdata
          postalcode = matchdata[0]
          this_location = Location.create(:postalcode => postalcode)
        end
        this_location = Location.create(:postalcode => postalcode)
        this_company.locations << this_location
        this_company.save
      end

      this_industry = Industry.create(eval(@scrape.company_industry))
      this_company.industries << this_industry
      this_company.save

      jobtitle = Jobtitle.create(eval(@scrape.jobtitle_params))
      person.jobtitles << jobtitle
      # Save this after shoveling
      person.save
    
    end 
  end

end

