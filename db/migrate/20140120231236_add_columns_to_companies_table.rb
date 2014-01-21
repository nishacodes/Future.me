class AddColumnsToCompaniesTable < ActiveRecord::Migration
  def change
    add_column :companies, :linkedin_url, :string
    add_column :companies, :address, :string
  end
end
