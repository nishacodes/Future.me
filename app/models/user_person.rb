class UserPerson < ActiveRecord::Base
  attr_accessible :person_id, :user_id

  belongs_to :user
  belongs_to :person
end