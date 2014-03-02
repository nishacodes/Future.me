class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    object.delete if object.name == "" || object.name == "null"
    object.name
  end

end
