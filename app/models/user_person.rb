class UserPerson < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :person
end
