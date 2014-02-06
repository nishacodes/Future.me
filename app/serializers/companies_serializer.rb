class CompaniesSerializer < ActiveModel::Serializer#ArraySerializer
  attributes :id, :name, :value
end
