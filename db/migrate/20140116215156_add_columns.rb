class AddColumns < ActiveRecord::Migration
  def change
    add_column :educations, :person_id, :integer
    add_column :schools, :location_id, :integer
  end
end
