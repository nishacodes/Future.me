class AddDisplayColumnToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :display, :string
  end
end
