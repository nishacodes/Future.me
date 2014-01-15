class CompaniesIndustries < ActiveRecord::Migration
  def change 
 	create_table :companies_industries, :id => false do |t|
 		t.integer :company_id
 		t.integer :industry_id
 	end
  end
end
