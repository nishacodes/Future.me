class Scraper
  attr_reader :profile, :educations, :current_companies, :past_companies, 
    :education_params, :jobtitle_params, :school_params, :company_params,
    :company_location, :company_industry

  def initialize(publicprofileurl)
    debugger
    @profile = Linkedin::Profile.get_profile(publicprofileurl)
    debugger
    # It seems that for people w/private profiles @profile will be nil
    unless @profile.nil?
      get_profile_info
    end
  end

  def get_profile_info
    @educations = @profile.education
    @current_companies = @profile.current_companies
    @past_companies = @profile.past_companies
    # @profile.recommended_visitors
  end
end