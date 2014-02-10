class ChangeColumnTypeCompaniesLinkedinid < ActiveRecord::Migration
  def change
    change_column :companies, :linkedin_id, :integer
  end
end
