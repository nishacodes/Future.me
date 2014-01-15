class CompaniesDepartments < ActiveRecord::Migration
  def change 
 	create_table :companies_deparments, :id => false do |t|
 		t.integer :company_id
 		t.integer :department_id
 	end
  end
end