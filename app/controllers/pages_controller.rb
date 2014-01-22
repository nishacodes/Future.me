class PagesController < ApplicationController
  
  def index
    # Populate.new
    @companies = Company.all
    @people = Person.all
    @educations = Education.all
    @schools = School.all
    @industries = Industry.all
    @locations = Location.all
  end

  def industries
    @industries = Industry.all
  end

  def industry
    @industry = Industry.find(params[:id])
  end

  def companies
    @companies = []

    Company.find_each do |company|
        company.industries.find_each do |industry|
          @companies << company if industry.id == params[:id].to_i
        end
        @companies
      end
  end

  def company
    @company = Company.find(params[:id])
  end

end
