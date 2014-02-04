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

    render json: @industries, :each_serializer => IndustriesSerializer, root: "industries"
  end

  def industry
    @industry = Industry.find(params[:i_id])
    render json: @industry, :each_serializer => IndustrySerializer, root: "industry"
  end

  def companies
    @companies = []

    Company.find_each do |company|
      company.industries.find_each do |industry|
        @companies << company if industry.id == params[:i_id].to_i
      end
      @companies.uniq!
    end
    render json: @companies, :each_serializer => CompaniesSerializer, root: "companies"
  end

  def company
    @company = Company.find(params[:c_id])
    render json: @company, :each_serializer => CompanySerializer, root: "company"
  end

  def people
    @people = []
    Person.find_each do |person|
      person.companies.find_each do |company|
        @people << person if company.id == params[:c_id].to_i
      end
      @people.uniq!
    end
    render json: @people, :each_serializer => PeopleSerializer, root: "people"
  end

  def person
    @person = Person.find(params[:p_id])
    render json: @person, :each_serializer => PersonSerializer, root: "person"
  end

  def schools
    @company = Company.find(params[:c_id])
    @schools = []
    Person.find_each do |person|
      person.schools.find_each do |school|
        @schools << school if person.companies.include?(@company)
      end
      @schools.uniq!
    end
    render json: @schools, :each_serializer => SchoolsSerializer, root: "schools"
  end

  def school_people
    @school = School.find(params[:s_id])
    @people = []
    Person.find_each do |person|
      person.schools.find_each do |school|
        @people << person if person.schools.include?(@school)
      end
      @people.uniq!
    end
    render json: @school, :each_serializer => SchoolSerializer, root: "school"
  end

end
