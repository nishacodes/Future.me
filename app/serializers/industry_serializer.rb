 class IndustrySerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    object.delete if object.name == ""
    object.name
  end

end
