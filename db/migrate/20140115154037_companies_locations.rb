class CompaniesLocations < ActiveRecord::Migration
  def change 
 	create_table :companies_locations, :id => false do |t|
 		t.integer :company_id
 		t.integer :location_id
 	end
  end
end
