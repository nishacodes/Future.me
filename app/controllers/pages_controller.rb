class PagesController < ApplicationController
  
  def index
    Populate.new.run
    @companies = Company.all
    @people = Person.all
    @educations = Education.all
    @schools = School.all
    @industries = Industry.all
    @locations = Location.all
  end

end
