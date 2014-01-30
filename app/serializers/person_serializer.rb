class PersonSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :linkedin_url
end
