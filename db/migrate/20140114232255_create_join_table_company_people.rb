class CreateJoinTableCompanyPeople < ActiveRecord::Migration
  def change
    create_table :company_people, id: false do |t|
      t.belongs_to :company
      t.belongs_to :person
    end
  end
end
