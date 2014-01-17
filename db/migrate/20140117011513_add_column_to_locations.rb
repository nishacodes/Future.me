class AddColumnToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :postalcode, :integer
  end
end
