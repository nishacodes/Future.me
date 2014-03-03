class PeopleSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :linkedin_url, :value

  # def value
  #   object.delete if object.value.to_i == 0
  #   object.value
  # end
end
