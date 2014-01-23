class Industry < ActiveRecord::Base
  attr_accessible :name
  validates :name, uniqueness: true

  has_many :company_industries
  has_many :companies, :through => :company_industries
end
