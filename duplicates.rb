# rails g migration add_display_column_to_companies
# serializer for companies and company, show display not name

def display_names(search, display)
  to_change = Company.where("name LIKE '%#{search}%'")
  to_change.each do |company|
    company.update_attribute(:display => "#{display}")
  end
end