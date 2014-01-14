class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :kind
      t.string :major
      t.integer :grad_yr
      t.integer :person_id
      t.integer :school_id

      t.timestamps
    end
  end
end
