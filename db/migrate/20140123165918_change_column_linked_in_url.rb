class ChangeColumnLinkedInUrl < ActiveRecord::Migration
  def change
  	rename_column :companies, :linkedin_url, :url
  end
end
