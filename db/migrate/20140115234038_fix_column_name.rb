class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :person_schools, :people_id, :person_id
  end
end
