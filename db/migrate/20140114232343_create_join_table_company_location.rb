class CreateJoinTableCompanyLocation < ActiveRecord::Migration
  def change
    create_table :company_locations, id: false do |t|
      t.belongs_to :company
      t.belongs_to :location
    end
  end
end
