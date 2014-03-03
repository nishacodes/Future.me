class EducationSerializer < ActiveModel::Serializer
  attributes :kind, :grad_yr, :major, :school_id, :person_id
end
