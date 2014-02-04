class IndustriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_companies, :total_people

  def total_companies
    # CompanyIndustry.where(:industry_id => id).length
  end

  def total_people
    # sum = 0
    # Industry.find(id).companies.each {|company| sum+= company.people.length }
    # return sum
  end
end
