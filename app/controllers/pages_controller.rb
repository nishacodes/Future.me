class PagesController < ApplicationController
  
  def index
    HardWorker.perform_async('derek')
    @companies = Company.all
    @people = Person.all
    @educations = Education.all
    @schools = School.all
    @industries = Industry.all
    @locations = Location.all
  end

end
