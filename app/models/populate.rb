class Populate
  attr_reader :api, :scraper, :company, :location, :person, :industry, :scrape

  DOMAINS = ["google.com", "twitter.com", "flatironschool.com"]

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
    @api.find_company(DOMAINS.last)
    @company = Company.create(:name => @api.company_name, :linkedin_id => @api.company_id)
  end

  def create_industry    
    @industry = Industry.create(:name => @api.company_industry)
    @industry.companies << @company
    @industry.save
  end

  def create_location
    @location = Location.create(:postalcode => @api.company_postalcode)
    @company.locations << @location
    @company.save
  end

  def create_people
    @api.people.each do |personhash|
      Person.create(:firstname => personhash["firstName"], :lastname => personhash["lastName"],
        :linkedin_id => personhash["id"], :linkedin_url => personhash["publicProfileUrl"])
    end
  end

  # NEEDS REFACTORING
  def update_people
    Person.all.each do |person|
       @scrape = Scraper.new(person.linkedin_url)
        unless @scrape.profile.nil? 

          # CREATE SCHOOLS AND EDUCATIONS
          @scrape.educations.each do |school|
            person.schools << School.create(:name => school[:name])
            education = Education.create(eval(@scrape.education_params)) # eval is a method that removes quotes from a string, so in this case it turns it into a hash
            # school.educations << education 
            person.educations << education
            # Save these after shoveling
            # school.save
            person.save
          end

          # # CREATE CURRENT COMPANIES
          @scrape.current_companies.each do |company|
            person.companies << Company.create(:name => company[:company])
            jobtitle = Jobtitle.create(eval(@scrape.jobtitle_params))
            person.jobtitles << jobtitle
            # company.jobtitles << jobtitle
            # Save these after shoveling
            person.save
            # company.save
          end

          # CREATE PAST COMPANIES
          @scrape.past_companies.each do |company|
            person.companies << Company.create(:name => company[:company])
            jobtitle = Jobtitle.create(eval(@scrape.jobtitle_params))
            person.jobtitles << jobtitle
            # company.jobtitles << jobtitle
            # Save these after shoveling
            person.save
            # company.save
          end 
        end
    end

    # THE IDEA HERE IS TO SEPARATE UPDATE_PEOPLE INTO SPECIFIC METHODS BUT THERE'S A SCOPE PROBLEM BC LOCAL VARIABLES DON'T CARRY OVER
    # ALSO WE ONLY WANT TO CREATE 1 INSTANCE OF SCRAPER PER PERSON, THAT'S WHY ALL THE METHODS ARE

    # def create_schools
    # end

    # def create_educations
    # end

    # def create_current_companies
    # end

    # def create_past_companies
    # end

    # def create_jobtitles
    # end

  end
end

