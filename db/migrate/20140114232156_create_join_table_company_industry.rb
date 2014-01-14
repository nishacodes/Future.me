class CreateJoinTableCompanyIndustry < ActiveRecord::Migration
  def change
    create_table :company_industries, id: false do |t|
      t.belongs_to :company
      t.belongs_to :industry
    end
  end
end
