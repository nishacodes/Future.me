class RenameTables < ActiveRecord::Migration
  def change
    rename_table :companies_industries, :company_industries
    rename_table :companies_people, :company_people
    rename_table :companies_locations, :company_locations
    rename_table :people_schools, :person_schools
  end
end
