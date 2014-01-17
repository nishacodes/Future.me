# require 'json'
# require 'oauth'
# require 'debugger'
class Api
  CONSUMER = OAuth::Consumer.new("77ze1x9zbqkfe7", "vnVI2BZxFEm8QxNM")
  ACCESS_TOKEN = OAuth::AccessToken.new(CONSUMER, "e974f1f1-9f42-4ab0-af97-b32bd6229e22", 
    "f732020e-436c-4b34-882c-c29973bfb5e3")
  FIELDS = ['id', 'first-name', 'last-name', 'public-profile-url', 'site-standard-profile-request', 'headline', 'industry', 'distance', 'num-connections', 'positions', 'educations', 'member-url-resources'].join(',')

  # generalize this thing i keep doing over and over. method would take two arguments: url and hash of k-v pairs


  def get_admin
    json_txt = ACCESS_TOKEN.get("http://api.linkedin.com/v1/people/~:(#{FIELDS})", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
    create_person(parsed)
    # returns all FIELDS
  end

  def get_person(id)
    json_txt = ACCESS_TOKEN.get("http://api.linkedin.com/v1/people::(id=#{id}):(#{FIELDS})", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
    create_person(parsed)
    # returns some FIELDS
  end

  def create_person(parsed)
    firstname = parsed["firstName"]
    lastname = parsed["lastName"]
    linkedin_id = parsed["id"]
    Person.create(:firstname => firstname, :lastname => lastname, :linkedin_id => linkedin_id)
  end

  def find_company_id(email)
    json_txt = ACCESS_TOKEN.get("https://api.linkedin.com/v1/companies?email-domain=#{email}", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)["values"][0]
    # returns company name and id
  end

  def company_details(id)
    json_txt = ACCESS_TOKEN.get("http://api.linkedin.com/v1/companies/#{id}:(name,industries,company-type,locations,website-url,employee-count-range)", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
    # returns name industry
  end

  def company_employees(id)
    i = 0
    json_txt = ACCESS_TOKEN.get("https://api.linkedin.com/v1/people-search:(people:(public-profile-url))?company-id=#{id}&current-company=true&sort=connections&count=10&start=#{i}", 'x-li-format' => 'json').body
    parsed = JSON.parse(json_txt)
    
  end
  
end

# a = Api.new
# debugger
# puts 'hi'