class RenameTable < ActiveRecord::Migration
  def change
    rename_table :companies_deparments, :company_departments
  end
end
