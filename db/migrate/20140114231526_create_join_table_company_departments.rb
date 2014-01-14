class CreateJoinTableCompanyDepartment < ActiveRecord::Migration
  def change
    create_table :company_departments, id: false do |t|
      t.belongs_to :company
      t.belongs_to :department
    end
  end
  
end

