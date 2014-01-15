class CreateJoinTableCompanyDepartments < ActiveRecord::Migration
  def change
    create_join_table :companies, :departments do |t|
      t.index :company_id
      t.index :department_id
    end
  end
end

