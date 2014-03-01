class SchoolSerializer < ActiveModel::Serializer
  attributes :id, :name, :location_id

  def name
    object.delete if object.name == ""
    object.name
  end

end
