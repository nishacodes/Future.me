class CompaniesPeople < ActiveRecord::Migration
  def change 
 	create_table :companies_people, :id => false do |t|
 		t.integer :company_id
 		t.integer :person_id
 	end
  end
end
