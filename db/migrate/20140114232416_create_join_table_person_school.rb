class CreateJoinTablePersonSchool < ActiveRecord::Migration
  def change
    create_table :person_schools, id: false do |t|
      t.belongs_to :person
      t.belongs_to :school
    end
  end
end
