class CreateJobtitles < ActiveRecord::Migration
  def change
    create_table :jobtitles do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :company_id
      t.integer :person_id

      t.timestamps
    end
  end
end
