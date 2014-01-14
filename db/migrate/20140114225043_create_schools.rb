class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.id :location_id

      t.timestamps
    end
  end
end
