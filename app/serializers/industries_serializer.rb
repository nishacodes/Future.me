class IndustriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :totalcompanies

  def totalcompanies
    CompanyIndustry.where(:industry_id => id).length
  end
end
