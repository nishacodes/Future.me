class Scraper
  attr_reader :profile, :educations, :current_companies, :past_companies, 
    :education_params, :jobtitle_params, :school_params, :company_params,
    :company_location, :company_industry

  def initialize(publicprofileurl)
    @profile = Linkedin::Profile.get_profile("#{publicprofileurl}")
    # It seems that for people w/private profiles @profile will be nil
    unless @profile.nil?
      get_profile_info
      get_params
    end
  end

  def get_profile_info
    @educations = @profile.education
    @current_companies = @profile.current_companies
    @past_companies = @profile.past_companies
    # @profile.recommended_visitors
  end

  # Storing the hash here to keep Populate model clean
  def get_params
    @school_params = "{:name => school[:name]}"
    @education_params = "{:kind => school[:description], :grad_yr => school[:period], :school_id => this_school.id}" # need location_id
    @jobtitle_params = "{:title => company[:title], :start_date => company[:start_date],
      :end_date => company[:end_date], :company_id => this_company.id}" # this is same for current / past companies
    @company_params ="{:name => company[:company], :url => company[:website], :address => company[:address]}"
    # this one is separated out bc we have to instantiate a new industry
    @company_industry = "{:name => company[:industry]}"
    
  end

end

