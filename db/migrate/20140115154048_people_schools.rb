class PeopleSchools < ActiveRecord::Migration
  def change 
   	create_table :people_schools, :id => false do |t|
   		t.integer :people_id
   		t.integer :school_id
   	end
  end
end
