class PagesController < ApplicationController
  
  def index
    @companies = Company.all
    @people = Person.all
    @educations = Education.all
    @schools = School.all
  end

end
